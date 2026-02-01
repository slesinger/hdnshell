"""
CSDB Scener HTML parser

Parses scener detail pages from csdb.dk HTML and returns structured data.
"""

import re
from typing import Optional

from bs4 import BeautifulSoup


def _find_b(soup: BeautifulSoup, label: str):
    return soup.find(
        "b",
        string=lambda s: s and s.strip().lower().startswith(label.lower()),
    )


def _extract_links_after_b(b_tag) -> list:
    if not b_tag:
        return []
    links = []
    for sib in b_tag.next_siblings:
        name = getattr(sib, "name", None)
        if name == "b":
            break
        if name == "br":
            continue
        if hasattr(sib, "find_all"):
            for a in sib.find_all("a"):
                text = a.get_text(strip=True)
                if text:
                    links.append(text)
        elif name == "a":
            text = sib.get_text(strip=True)
            if text:
                links.append(text)
    return links


def _extract_text_after_b(b_tag) -> Optional[str]:
    if not b_tag:
        return None
    for sib in b_tag.next_siblings:
        name = getattr(sib, "name", None)
        if name == "b":
            break
        if name == "br":
            continue
        if hasattr(sib, "get_text"):
            text = sib.get_text(" ", strip=True)
        else:
            text = str(sib).strip()
        if text:
            return text
    return None


def _find_table_after_b(b_tag):
    if not b_tag:
        return None
    for sib in b_tag.next_siblings:
        if getattr(sib, "name", None) == "table":
            return sib
    return None


def _extract_release_rows(table, include_roles: bool = False) -> list:
    if not table:
        return []

    rows = []
    for tr in table.find_all("tr"):
        tds = tr.find_all("td")
        if not tds:
            continue

        title_link = tr.find("a", href=lambda h: h and "/release/?id=" in h)
        if not title_link:
            continue

        title = title_link.get_text(strip=True)
        href = title_link.get("href", "")
        match = re.search(r"id=(\d+)", href)
        release_id = int(match.group(1)) if match else None

        by_links = []
        for a in tds[0].find_all("a", href=True):
            href = a.get("href", "")
            if "/group/?id=" in href or "/scener/?id=" in href:
                text = a.get_text(strip=True)
                if text:
                    by_links.append(text)
        by = ", ".join(by_links) if by_links else None

        year = None
        row_text = tr.get_text(" ", strip=True)
        year_match = re.search(r"(19|20)\d{2}", row_text)
        if year_match:
            year = year_match.group(0)

        type_text = None
        for td in reversed(tds):
            td_text = td.get_text(" ", strip=True)
            if not td_text or "..." in td_text:
                continue
            if include_roles and td_text.startswith("("):
                continue
            if year and year in td_text and len(td_text) > len(year):
                type_text = td_text.replace(year, "").strip()
                break
            if year and td_text == year:
                continue
            if re.search(r"[A-Za-z]", td_text):
                type_text = td_text
                break

        roles = None
        if include_roles:
            for td in reversed(tds):
                td_text = td.get_text(" ", strip=True)
                if td_text.startswith("(") and td_text.endswith(")"):
                    roles = td_text.strip("()")
                    break

        rows.append({
            "id": release_id,
            "title": title,
            "year": year,
            "type": type_text,
            "by": by,
            "roles": roles,
        })

    return rows


def parse_csdb_scener_detail(html: str) -> dict:
    """
    Parse CSDB scener HTML page into a structured dict.
    """
    soup = BeautifulSoup(html, "html.parser")

    handle = None
    handle_tag = soup.find("font", attrs={"size": "6"})
    if handle_tag:
        handle = handle_tag.get_text(strip=True)

    name_tag = _find_b(soup, "Name")
    real_name = _extract_text_after_b(name_tag)

    country_tag = _find_b(soup, "Country")
    country = _extract_text_after_b(country_tag)

    functions_tag = _find_b(soup, "Functions")
    functions = _extract_links_after_b(functions_tag)

    member_tag = _find_b(soup, "Member of")
    ex_member_tag = _find_b(soup, "Ex member of")

    member_of = _extract_links_after_b(member_tag)
    ex_member_of = _extract_links_after_b(ex_member_tag)

    # Fallback: sometimes groups appear under Ex member only
    groups = member_of or ex_member_of

    releases_tag = _find_b(soup, "Releases released")
    credits_tag = _find_b(soup, "Credits")

    releases_table = _find_table_after_b(releases_tag)
    credits_table = _find_table_after_b(credits_tag)

    releases = _extract_release_rows(releases_table, include_roles=False)
    credits = _extract_release_rows(credits_table, include_roles=True)

    return {
        "handle": handle or "Unknown",
        "real_name": real_name,
        "country": country,
        "functions": functions,
        "groups": groups,
        "ex_groups": ex_member_of if ex_member_of else [],
        "releases": releases,
        "credits": credits,
    }
