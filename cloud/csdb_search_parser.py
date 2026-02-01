from bs4 import BeautifulSoup
import requests
from typing import Dict, Any


def parse_csdb_find(html: str) -> Dict:
    soup = BeautifulSoup(html, 'html.parser')
    result = {}
    main = soup.find('td', valign='top', width="100%")
    if not main:
        return result

    # Helper to extract items from a section
    def extract_items(section_title, id_prefix):
        import re
        b_tag = None
        for b in main.find_all('b'):
            if section_title in b.get_text():
                b_tag = b
                break
        items = []
        count = 0
        if b_tag:
            m = re.match(r"(\d+)[^\d]*", b_tag.get_text())
            if m:
                count = int(m.group(1))
            ol = b_tag.find_next('ol')
            if ol:
                for li in ol.find_all('li'):
                    # Release parsing
                    if id_prefix == "/release/?id=":
                        a_release = li.find('a', href=lambda h: h and '/release/?id=' in h)
                        a_group = li.find('a', href=lambda h: h and '/group/?id=' in h)
                        name = a_release.text.strip() if a_release else None
                        release_id = a_release['href'].split('=')[-1] if a_release else None
                        group_name = a_group.text.strip() if a_group else None
                        group_id = a_group['href'].split('=')[-1] if a_group else None
                        # Type and year/date: get all parenthesized values
                        parens = re.findall(r'\(([^)]*)\)', li.get_text())
                        release_type = parens[0] if len(parens) > 0 else None
                        year = parens[1] if len(parens) > 1 else None
                        items.append({
                            "id": release_id,
                            "name": name,
                            "type": release_type,
                            "group_id": group_id,
                            "group_name": group_name,
                            "year": year,
                        })
                    # Group parsing
                    elif id_prefix == "/group/?id=":
                        a_group = li.find('a', href=lambda h: h and '/group/?id=' in h)
                        name = a_group.text.strip() if a_group else None
                        group_id = a_group['href'].split('=')[-1] if a_group else None
                        m_country = re.search(r'\(([^)]*)\)', li.get_text())
                        country = m_country.group(1) if m_country else None
                        items.append({
                            "id": group_id,
                            "name": name,
                            "country": country,
                        })
                    # Scener, BBS, SID: fallback to previous logic
                    else:
                        a = li.find('a', href=lambda h: h and id_prefix in h)
                        id_ = None
                        if a and 'href' in a.attrs:
                            id_ = a['href'].split('=')[-1]
                        text = ' '.join(li.stripped_strings)
                        items.append({"id": id_, "text": text})
        return count, items

    # Releases
    release_count, releases = extract_items("release", "/release/?id=")
    result["release_count"] = release_count
    result["releases"] = releases

    # Groups
    group_count, groups = extract_items("group", "/group/?id=")
    result["group_count"] = group_count
    result["groups"] = groups

    # Sceners
    scener_count, sceners = extract_items("scener", "/scener/?id=")
    result["scener_count"] = scener_count
    result["sceners"] = sceners

    # BBS
    bbs_count, bbses = extract_items("BBS", "/bbs/?id=")
    result["bbs_count"] = bbs_count
    result["bbses"] = bbses

    # SID
    sid_count, sids = extract_items("SID", "/sid/?id=")
    result["sid_count"] = sid_count
    result["sids"] = sids

    return result


HEADERS = {
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
    'Accept-Language': 'en-US,en;q=0.5',
    'Connection': 'keep-alive',
}


class CSDB:
    BASE_URL = "https://csdb.dk"

    def search(self, query: str) -> Dict[str, Any]:
        """
        Search csdb.dk for a string and return releases and groups.
        """
        url = f"{self.BASE_URL}/search/?seinsel=all&search={query}"
        resp = requests.get(url, headers=HEADERS)
        return self._parse_search_html(resp.text)

    def latest_releases(self) -> Dict[str, Any]:
        """
        Get latest releases from csdb.dk (parsing the main page or releases page).
        """
        url = f"{self.BASE_URL}/?type=release"
        resp = requests.get(url, headers=HEADERS)
        # This is a placeholder; real parsing logic should be implemented for the actual page structure
        return self._parse_latest_releases_html(resp.text)

    def latest_forum(self) -> Any:
        """
        Get latest forum posts from csdb.dk (parsing the forum page).
        """
        url = f"{self.BASE_URL}/forums/"
        resp = requests.get(url, headers=HEADERS)
        # This is a placeholder; real parsing logic should be implemented for the actual page structure
        return self._parse_latest_forum_html(resp.text)

    def _parse_search_html(self, html: str) -> Dict[str, Any]:
        soup = BeautifulSoup(html, 'html.parser')
        result = {"releases": [], "groups": []}

        main = soup.find('td', valign='top', width="100%")
        if not main:
            return result

        # Find release matches
        release_section = main.find(
            string=lambda t: t and "release matches" in t)
        if release_section:
            ol = release_section.find_next('ol')
            for li in ol.find_all('li'):
                a_release = li.find(
                    'a', href=lambda h: h and '/release/?id=' in h)
                name = a_release.text.strip() if a_release else None
                url = f"{self.BASE_URL}{a_release['href']}" if a_release else None
                text = li.get_text(" ", strip=True)
                parts = text.split(' by ')
                type_date = parts[0].split(')', 1)
                type_ = type_date[0].split(
                    '(')[-1].strip() if '(' in type_date[0] else None
                date = type_date[1].strip(' ()') if len(
                    type_date) > 1 else None
                a_group = li.find('a', href=lambda h: h and '/group/?id=' in h)
                group_name = a_group.text.strip() if a_group else None
                group_url = f"{self.BASE_URL}{a_group['href']}" if a_group else None
                result["releases"].append({
                    "name": name,
                    "url": url,
                    "type": type_,
                    "date": date,
                    "group_name": group_name,
                    "group_url": group_url
                })

        # Find group matches
        group_section = main.find(string=lambda t: t and "group match" in t)
        if group_section:
            ol = group_section.find_next('ol')
            for li in ol.find_all('li'):
                a_group = li.find('a', href=lambda h: h and '/group/?id=' in h)
                name = a_group.text.strip() if a_group else None
                url = f"{self.BASE_URL}{a_group['href']}" if a_group else None
                text = li.get_text(" ", strip=True)
                country = text.split(
                    '(')[-1].strip(')') if '(' in text else None
                result["groups"].append({
                    "name": name,
                    "url": url,
                    "country": country
                })

        return result

    def _parse_latest_releases_html(self, html: str) -> Dict[str, Any]:
        # Placeholder: implement actual parsing for latest releases page
        # Return structure similar to search_list
        return {"releases": [], "groups": []}

    def _parse_latest_forum_html(self, html: str) -> Any:
        # Placeholder: implement actual parsing for latest forum posts
        return []

# Example usage:
# parser = CSDBParser()
# data = parser.search("Hondani")
# print(data)
