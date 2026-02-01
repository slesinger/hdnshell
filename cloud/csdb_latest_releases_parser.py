import re
from bs4 import BeautifulSoup


def parse_latest_releases(html_content: str):
    """
    Parses the HTML content of the CSDb latest releases page.
    """
    soup = BeautifulSoup(html_content, 'html.parser')
    releases = []

    table = soup.find('table', width="100%")
    if not table:
        return releases

    for row in table.find_all('tr')[1:]:  # Skip header row
        cols = row.find_all('td')
        if len(cols) == 5:
            release_link = cols[1].find('a')
            if not release_link or 'href' not in release_link.attrs:
                continue

            release_id_match = re.search(
                r'release/\?id=(\d+)', release_link['href'])
            if not release_id_match:
                continue

            release_id = release_id_match.group(1)
            name = release_link.get_text(strip=True)

            release_type = cols[2].get_text(strip=True)

            groups = []
            for group_link in cols[3].find_all('a'):
                group_id_match = re.search(
                    r'/(group|scener)/\?id=(\d+)', group_link['href'])
                if group_id_match:
                    groups.append({
                        'id': group_id_match.group(2),
                        'name': group_link.get_text(strip=True)
                    })

            release_date = cols[4].get_text(strip=True)

            releases.append({
                'id': release_id,
                'name': name,
                'type': release_type,
                'groups': groups,
                'release_date': release_date
            })

    return releases
