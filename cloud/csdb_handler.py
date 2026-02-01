"""
CSDBHandler - Handles requests to csdb.dk database

Queries the CSDB.dk API for C64 scene information.
Processes requests starting with "c:"
"""
import logging
import os
import requests
import zipfile
import fnmatch
import ftplib
import xml.etree.ElementTree as ET
from pathlib import Path
from typing import Optional, List
from pydantic import BaseModel
from base_handler import BaseHandler
from dotenv import load_dotenv
from shared_state import get_session_state
from csdb_group_parser import parse_csdb_group_detail
from csdb_search_parser import parse_csdb_find
from csdb_latest_releases_parser import parse_latest_releases


class CSDBRelease(BaseModel):
    name: str
    release_type: str
    release_date: str
    groups: List[str]


class CSDBGroup(BaseModel):
    name: str
    member_count: int
    release_count: int


class CSDBScener(BaseModel):
    handle: str
    real_name: Optional[str] = None
    groups: List[str]
    ex_groups: List[str] = []
    country: Optional[str] = None
    functions: List[str] = []
    releases: List[dict] = []
    credits: List[dict] = []


class CSDBEvent(BaseModel):
    name: str
    start_date: str
    end_date: Optional[str] = None

# Load environment variables (override=True to prevent system vars from interfering)


load_dotenv(override=True)

logger = logging.getLogger(__name__)

# CSDB API base URL
CSDB_API_URL = "https://csdb.dk/webservice/"
CSDB_RELEASE_DOWNLOAD_URL = "https://csdb.dk/release/download.php?id="

# Browser-like headers to reduce 503 responses from csdb.dk
CSDB_BROWSER_HEADERS = {
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
    'Accept-Language': 'en-US,en;q=0.9',
    'Connection': 'keep-alive',
    'Cookie': 'cookieconsent_dismissed=yes; session_id_set=7242%7CrKWU7Sc.fGehhZ6p5Ajde.pm79IMqkO; coockiecode=1760520990-1102016201; PHPSESSID=d9abd02c84c1648409eb95dcb78602a2',
    'Referer': 'https://csdb.dk/search/?seinsel=all&search=hondani&Go.x=0&Go.y=0',
    'Sec-Fetch-Dest': 'document',
    'Sec-Fetch-Mode': 'navigate',
    'Sec-Fetch-Site': 'same-origin',
    'Sec-Fetch-User': '?1',
    'Upgrade-Insecure-Requests': '1',
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36',
    'sec-ch-ua': '"Chromium";v="142", "Google Chrome";v="142", "Not_A Brand";v="99"',
    'sec-ch-ua-mobile': '?0',
    'sec-ch-ua-platform': '"Linux"',
}


class CSDBHandler(BaseHandler):
    """Handler for CSDB.dk database queries"""

    def _download_file_by_id(self, file_id: int, target_path: Path, referer: Optional[str] = None) -> Optional[str]:
        """Download file by CSDB file id to target_path. Returns error message or None."""
        download_url = f"{CSDB_RELEASE_DOWNLOAD_URL}{file_id}"
        headers = dict(CSDB_BROWSER_HEADERS)
        if referer:
            headers['Referer'] = referer
        try:
            response = self.session.get(download_url, headers=headers, timeout=20, allow_redirects=True, stream=True)
            response.raise_for_status()
        except requests.exceptions.RequestException as e:
            return f"Failed to download {target_path.name}: {e}"

        content_type = response.headers.get('Content-Type', '')
        if 'text/html' in content_type.lower():
            return f"Failed to download {target_path.name}: received HTML instead of file"

        try:
            with open(target_path, 'wb') as out_file:
                for chunk in response.iter_content(chunk_size=1024 * 64):
                    if chunk:
                        out_file.write(chunk)
        except OSError as e:
            return f"Failed to write {target_path.name}: {e}"

        # Basic zip signature check for .zip
        if target_path.suffix.lower() == '.zip':
            try:
                with open(target_path, 'rb') as fh:
                    magic = fh.read(4)
                if magic not in [b'PK\x03\x04', b'PK\x05\x06', b'PK\x07\x08']:
                    return f"Downloaded file is not a valid zip archive: {target_path.name}"
            except OSError as e:
                return f"Failed to verify {target_path.name}: {e}"

        return None

    def __init__(self):
        """Initialize CSDBHandler"""
        self.session = requests.Session()
        self.session.headers.update(CSDB_BROWSER_HEADERS)

        # Add authentication if available
        csdb_user = os.getenv('CSDB_USER')
        csdb_password = os.getenv('CSDB_PASSWORD')
        if csdb_user and csdb_password:
            self.session.auth = (csdb_user, csdb_password)
            logger.info("CSDB authentication enabled.")

    def can_handle(self, text: str, session_id: int = 0) -> bool:
        """
        Only handle if text starts with c:, or if c: is the active module for this session.
        """
        t = text.strip().lower()
        state = get_session_state(session_id)
        if t.startswith("c:") or t == "#c":
            return True
        # Only assume csdb module if user explicitly switched to it
        if state.get('active_module') == 'c':
            # Don't handle if another command is detected
            if any(t.startswith(p) for p in ["i:", "?", "help"]):
                return False
            return True
        return False

    def handle(self, text: str, session_id: int = 0) -> str:
        """
        Process CSDB query or virtual navigation (cd/find/etc) for a session
        """
        t = text.strip()
        t_lower = t.lower()
        state = get_session_state(session_id)

        # If starts with c:, switch module and parse rest
        if t_lower.startswith("c:") or t_lower.startswith("#c"):
            query = t[2:].strip()
            if not query:
                state['active_module'] = 'c'
                state['active_dir'] = None
                state['active_id'] = None
                state['zip_id'] = None
                state['zip_files'] = None
                return "CSDB mode"

            # Preserve directory context when already in CSDB module
            if state.get('active_module') != 'c':
                state['active_dir'] = None
                state['active_id'] = None
                state['zip_id'] = None
                state['zip_files'] = None
            state['active_module'] = 'c'
            return self._process_csdb_command(query, session_id)

        # If c: is active module, interpret commands
        if state.get('active_module') == 'c':
            return self._process_csdb_command(t, session_id)

        # Fallback: not handled
        return "Unknown command. Type 'help' for available commands."

    def _process_csdb_command(self, query: str, session_id: int = 0) -> str:
        """
        Parse and execute a CSDB command string (e.g. 'group 123', 'find foo', etc) for a session
        """
        try:
            return self._parse_and_execute(query, session_id)
        except Exception as e:
            logger.error(f"Error processing CSDB command: {e}")
            return f"Error: {str(e)}"

    def _format_find_result(self, result: dict, custom_section=None) -> str:
        """
        Format a find result dict as text (same as _find_csdb output)
        If custom_section is provided, only format that section: (section, show_all_label, key, count_key)
        """
        if 'error' in result:
            return result['error']

        def fmt_items(items, count, section, show_all_label):
            output = []
            if items:
                output.append(f"\x9f{count} {section}\x9a:")
                for item in items[:10]:  # Limit to 10 items
                    # Prefer 'text' if present, fallback to 'name', fallback to N/A
                    label = item.get('text') or item.get('name') or 'N/A'
                    output.append(f"  \x9b{item.get('id', 'N/A')}\x9a: {label}")
                if count > 10:
                    output.append(f"  (and {count - 10} more...)")
            return output

        output = []
        if custom_section:
            section, show_all_label, key, count_key = custom_section
            output += fmt_items(result.get(key, []),
                                result.get(count_key, 0), section, show_all_label)
        else:
            output += fmt_items(result.get('releases', []),
                                result.get('release_count', 0), 'release matches', 'releases')
            output += fmt_items(result.get('groups', []),
                                result.get('group_count', 0), "group", "groups")
            output.extend(fmt_items(result.get('sceners', []), result.get(
                'scener_count', 0), "scener", "sceners"))
        return '\n'.join(output) if output else "No results found."

    def _cp_file(self, file_pattern: str, session_id: int) -> str:
        """Copy file(s) from a release or zip."""
        state = get_session_state(session_id)
        if not state.get('active_dir') == 'release' or not state.get('active_id'):
            return "cp can only be used within a release."

        output = []
        tmp_dir = Path("/tmp/hdnshell")
        tmp_dir.mkdir(exist_ok=True)

        if state.get('zip_id') and state.get('zip_files'):
            # Copy from zip
            zip_path = tmp_dir / f"{state['zip_id']}.zip"
            if not zip_path.exists():
                return f"Zip file for {state['zip_id']} not found."
            with zipfile.ZipFile(zip_path, 'r') as z:
                for f in state['zip_files']:
                    if fnmatch.fnmatch(f, file_pattern):
                        z.extract(f, path=tmp_dir)
                        output.append(f"Copied {f} to /tmp/hdnshell")
        else:
            # Copy from release
            release_info = self._get_parsed_release_info(state['active_id'])
            if not release_info or 'files' not in release_info:
                return "No files found for this release."

            for f in release_info['files']:
                if fnmatch.fnmatch(f['name'], file_pattern):
                    file_path = tmp_dir / f['name']
                    referer = f"https://csdb.dk/release/?id={state['active_id']}"
                    error = self._download_file_by_id(int(f['id']), file_path, referer=referer)
                    if error:
                        output.append(error)
                    else:
                        output.append(f"Copied {f['name']} to /tmp/hdnshell")

        if not output:
            return "No files copied."

        # If the copied file is a zip, extract allowed file types and upload via FTP
        allowed_exts = {'.prg', '.d64', '.d81', '.tap', '.sid', '.crt', '.reu', '.dnp', '.mod', '.txt', '.cfg'}
        extracted_files = []
        for line in output:
            name = line.replace("Copied ", "").replace(" to /tmp/hdnshell", "")
            file_path = tmp_dir / name
            if file_path.suffix.lower() == '.zip' and file_path.exists():
                try:
                    with zipfile.ZipFile(file_path, 'r') as z:
                        for member in z.namelist():
                            member_path = Path(member)
                            if member_path.suffix.lower() in allowed_exts:
                                z.extract(member, path=tmp_dir)
                                extracted_files.append(tmp_dir / member)
                except zipfile.BadZipFile:
                    output.append(f"Invalid zip archive: {file_path.name}")

        files_to_upload = []
        if extracted_files:
            files_to_upload.extend(extracted_files)
        else:
            # Upload the downloaded file itself if it matches the allowed extensions
            for line in output:
                name = line.replace("Copied ", "").replace(" to /tmp/hdnshell", "")
                file_path = tmp_dir / name
                if file_path.suffix.lower() in allowed_exts:
                    files_to_upload.append(file_path)

        if not files_to_upload:
            return '\n'.join(output)

        ftp_host = state.get('client_ip')
        if not ftp_host:
            output.append("FTP upload skipped: client IP not available")
            return '\n'.join(output)

        try:
            with ftplib.FTP(ftp_host) as ftp:
                ftp.login()
                ftp.cwd('/temp')
                for fpath in files_to_upload:
                    if fpath.exists():
                        with open(fpath, 'rb') as fh:
                            ftp.storbinary(f"STOR {fpath.name}", fh)
                        output.append(f"Uploaded {fpath.name} to ftp://{ftp_host}/temp")
        except Exception as e:
            output.append(f"FTP upload failed: {e}")

        return '\n'.join(output)

    def _cd_into_zip(self, file_id: int, session_id: int) -> str:
        """Download and extract a zip file, listing its contents."""
        state = get_session_state(session_id)
        tmp_dir = Path("/tmp/hdnshell")
        tmp_dir.mkdir(exist_ok=True)
        zip_path = tmp_dir / f"{file_id}.zip"

        try:
            error = self._download_file_by_id(file_id, zip_path, referer=f"https://csdb.dk/release/?id={state.get('active_id')}")
            if error:
                return error

            with zipfile.ZipFile(zip_path, 'r') as z:
                files = z.namelist()
                state['zip_id'] = file_id
                state['zip_files'] = files
                return "Contents of zip:\n" + "\n".join(f"  - {f}" for f in files)

        except requests.exceptions.RequestException as e:
            return f"Failed to download zip: {e}"
        except zipfile.BadZipFile:
            return "Downloaded file is not a valid zip archive."
        except Exception as e:
            logger.error(f"Error handling zip: {e}")
            return "An error occurred while processing the zip file."

    def _query_csdb(self, query: str) -> str:
        """
        Make a raw query to the CSDB webservice and return raw response
        """
        try:
            response = self.session.get(f"{CSDB_API_URL}?{query}")
            response.raise_for_status()
            return response.text
        except requests.exceptions.RequestException as e:
            logger.error(f"CSDB query failed: {e}")
            return f"Error: Could not connect to CSDB ({e})"

    def _find_csdb(self, search_text: str, seinsel: str = "all") -> dict:
        """
        Perform CSDB find (HTML search) and return parsed result dict
        Use curl-like headers to avoid 503 errors.
        """
        logger.info(f"CSDB search_text: {search_text}")
        url = f"https://csdb.dk/search/?seinsel={seinsel}&search={search_text}&Go.x=8&Go.y=9"
        try:
            resp = self.session.get(url, headers=CSDB_BROWSER_HEADERS, timeout=10)
            resp.raise_for_status()
            html = resp.text
        except requests.RequestException as e:
            return {'error': f"Network error: {str(e)}"}

        return parse_csdb_find(html)

    def _get_entry_info(self, entry_type: str, entry_id: int, session_id: int, depth: int = 2) -> str:
        def format_members(members: list) -> str:
            if not members:
                return "(none)"

            lines = []
            for m in members:
                member_id = m.get('id') or ''
                name = m.get('name', '')
                status = m.get('status') or ''
                if status:
                    status = f"({status})"
                roles = m.get('roles') or ''

                # Format: id (padded) name (status) - roles
                details = f"{name} {status} - {roles}".strip()
                line = f"\x9b{member_id:<6}\x9a {details}"
                lines.append(line[:40])
            return '\n'.join(lines)

        def format_release_output(release_data: dict, entry_id: int) -> str:
            """Format release output from HTML parser data"""

            output = []
            # Add release name as heading if present
            release_name = release_data.get('name')
            if release_name:
                output.append(f"\x9fRelease\x9a: {release_name}")

            # Released by: group_id    group_name
            if release_data.get('groups'):
                groups_parts = []
                for group in release_data['groups']:
                    group_id = group.get('id', '')
                    group_name = group.get('name', '')
                    if group_id and group_name:
                        groups_parts.append(f"{group_id} {group_name}")
                if groups_parts:
                    output.append(f"\x9fReleased by\x9a: {', '.join(groups_parts)}")

            # Release Date
            if release_data.get('release_date'):
                output.append(f"\x9fRelease Date\x9a: {release_data['release_date']}")

            # Type
            if release_data.get('type'):
                output.append(f"\x9fType\x9a: {release_data['type']}")

            # User rating
            if release_data.get('user_rating'):
                output.append(f"\x9fUser rating\x9a: {release_data['user_rating']}")

            # Files
            files = release_data.get('files', [])
            if files:
                output.append("\n\x9fFiles\x9a:")
                for f in files:
                    size_str = f" ({f['size']})" if 'size' in f else ""
                    output.append(
                        f"\x9b{f.get('id', '')}\x9a {f.get('name', '')}{size_str} ({f.get('downloads', 'N/A')} d/l)")

            return '\n'.join(output)

        def format_scener_output(model: CSDBScener) -> str:
            result = f"\x9fHandle\x9a: {model.handle}\n"
            if model.real_name:
                result += f"\x9fName\x9a: {model.real_name}\n"
            if model.country:
                result += f"\x9fCountry\x9a: {model.country}\n"
            if model.functions:
                result += f"\x9fFunctions\x9a: {', '.join(model.functions)}\n"
            if model.groups:
                result += f"\x9fGroups\x9a: {', '.join(model.groups)}"
            if model.ex_groups:
                result += f"\n\x9fEx member of\x9a: {', '.join(model.ex_groups)}"
            if model.releases:
                result += "\n\n\x9fReleases released\x9a:"
                for rel in model.releases:
                    rel_id = rel.get('id', '') or ''
                    title = rel.get('title', 'Unknown')
                    year = rel.get('year')
                    rel_type = rel.get('type')
                    line = f"\x9b{str(rel_id):<6}\x9a {title}"
                    if year:
                        line += f" ({year})"
                    if rel_type:
                        line += f" [{rel_type}]"
                    result += "\n" + line
            if model.credits:
                result += "\n\n\x9fCredits\x9a:"
                for rel in model.credits:
                    rel_id = rel.get('id', '') or ''
                    title = rel.get('title', 'Unknown')
                    year = rel.get('year')
                    rel_type = rel.get('type')
                    roles = rel.get('roles')
                    line = f"\x9b{str(rel_id):<6}\x9a {title}"
                    if year:
                        line += f" ({year})"
                    if rel_type:
                        line += f" [{rel_type}]"
                    if roles:
                        line += f" - {roles}"
                    result += "\n" + line
            return result

        def format_event_output(model: CSDBEvent) -> str:
            result = f"\x9fEvent\x9a: {model.name}\n"
            result += f"\x9fStart\x9a: {model.start_date}\n"
            if model.end_date and model.end_date != model.start_date:
                result += f"\x9fEnd\x9a: {model.end_date}"
            return result

        def format_group_output(group_data: dict, entry_id: int) -> str:
            name = group_data.get('name', f"Group {entry_id}")
            abbr = group_data.get('abbreviation')
            country = group_data.get('country')
            group_type = group_data.get('group_type')
            user_rating = group_data.get('user_rating')
            # Compose the first line: name (abbr) [country]
            first_line = f"\x9f{name}\x9a"
            if abbr:
                first_line += f" ({abbr})"
            if country:
                first_line += f" [{country}]"
            output = [first_line]
            type_rating_line = None
            if group_type and user_rating:
                type_rating_line = f"\x9fType\x9a: {group_type} | \x9fRating\x9a: {user_rating}"
            elif group_type:
                type_rating_line = f"\x9fType\x9a: {group_type}"
            elif user_rating:
                type_rating_line = f"\x9fRating\x9a: {user_rating}"
            if type_rating_line:
                output.append(type_rating_line)
            output.append("")
            # Only add 'All Members:' if there are members
            members = group_data.get('members', [])
            if members:
                output.append("\x9fAll Members\x9a:")
                output.append(format_members(members))
                output.append("")

            # Add 'Releases' section if present
            releases = group_data.get('releases', [])
            if releases:
                output.append(f"\x9fReleases\x9a: ({len(releases)})")

                def format_release(r):
                    title = r.get('title', 'Unknown')
                    year = r.get('year')
                    release_type = r.get('type')
                    release_id = r.get('id', '')

                    year_str = f"({year})" if year else ""
                    type_str = f"[{release_type}]" if release_type else ""

                    # Format: id (padded) title (year) [type]
                    full_title = f"{title} {year_str} {type_str}".strip()
                    line = f"\x9b{str(release_id):<6}\x9a {full_title}"
                    return line[:40]

                for rel in releases:
                    output.append(format_release(rel))
                output.append("")
            return '\n'.join(output)
        """
        Get information for a specific CSDB entry
        For 'group' and 'release', use HTML parser for detailed information.
        """
        state = get_session_state(session_id)
        if state.get('zip_id') and state.get('zip_files'):
            return "\x9fContents of zip file\x9a:\n" + '\n'.join(state['zip_files'])

        if entry_type == 'group':
            try:
                url = f"https://csdb.dk/group/?id={entry_id}"
                logger.info(f"Fetching group HTML for id {entry_id}: {url}")
                resp = self.session.get(url, headers=CSDB_BROWSER_HEADERS, timeout=10)
                resp.raise_for_status()
                group_data = parse_csdb_group_detail(resp.text)
                return format_group_output(group_data, entry_id)
            except Exception as e:
                return f"Error parsing group page: {e}"

        if entry_type == 'release':
            try:
                release_data = self._get_parsed_release_info(entry_id)
                if 'error' in release_data:
                    return release_data['error']
                return format_release_output(release_data, entry_id)
            except Exception as e:
                return f"Error parsing release page: {e}"

        if entry_type == 'scener':
            try:
                from csdb_scener_parser import parse_csdb_scener_detail
                url = f"https://csdb.dk/scener/?id={entry_id}"
                logger.info(f"Fetching scener HTML for id {entry_id}: {url}")
                resp = self.session.get(url, headers=CSDB_BROWSER_HEADERS, timeout=10)
                resp.raise_for_status()
                scener_data = parse_csdb_scener_detail(resp.text)
                model = CSDBScener(
                    handle=scener_data.get('handle', 'Unknown'),
                    real_name=scener_data.get('real_name'),
                    groups=scener_data.get('groups', []),
                    ex_groups=scener_data.get('ex_groups', []),
                    country=scener_data.get('country'),
                    functions=scener_data.get('functions', []),
                    releases=scener_data.get('releases', []),
                    credits=scener_data.get('credits', []),
                )
                return format_scener_output(model)
            except Exception as e:
                return f"Error parsing scener page: {e}"

        try:
            params = {
                'type': entry_type,
                'id': entry_id,
                'depth': min(depth, 4)
            }
            logger.info(f"Fetching {entry_type} {entry_id} from CSDB XML API")
            response = self.session.get(
                CSDB_API_URL, params=params, timeout=10)
            response.raise_for_status()
            root = ET.fromstring(response.content)
            if entry_type == 'release':
                # This code path should not be reached anymore
                name = root.findtext('.//Release/Name', 'Unknown')
                release_type = root.findtext('.//Release/Type', 'Unknown')
                release_date = root.findtext(
                    './/Release/ReleaseDate', 'Unknown')
                groups = [group.findtext('Name', 'Unknown') for group in root.findall(
                    './/Release/ReleasedBy/Group')]
                model = CSDBRelease(
                    name=name,
                    release_type=release_type,
                    release_date=release_date,
                    groups=groups
                )
                return format_release_output({}, entry_id)
            elif entry_type == 'scener':
                handle = root.findtext('.//Scener/Handle', 'Unknown')
                real_name = root.findtext('.//Scener/RealName', None)
                groups = [group.findtext('Name', 'Unknown')
                          for group in root.findall('.//Scener/Groups/Group')]
                model = CSDBScener(
                    handle=handle,
                    real_name=real_name,
                    groups=groups,
                    ex_groups=[],
                    country=None,
                    functions=[]
                )
                return format_scener_output(model)
            elif entry_type == 'event':
                name = root.findtext('.//Event/Name', 'Unknown')
                start_date = root.findtext('.//Event/StartDate', 'Unknown')
                end_date = root.findtext('.//Event/EndDate', None)
                model = CSDBEvent(
                    name=name,
                    start_date=start_date,
                    end_date=end_date
                )
                return format_event_output(model)
            else:
                return self._format_generic(root)
        except requests.RequestException as e:
            logger.error(f"HTTP error querying CSDB: {e}")
            return f"Network error: {str(e)}"
        except ET.ParseError as e:
            logger.error(f"XML parse error: {e}")
            return "Error parsing CSDB response"
        except Exception as e:
            logger.error(f"Error getting entry info: {e}")
            return f"Error: {str(e)}"

    def _get_parsed_release_info(self, release_id: int) -> dict:
        """Helper to get parsed release info from HTML."""
        from csdb_release_parser import parse_csdb_release_detail
        url = f"https://csdb.dk/release/?id={release_id}"
        try:
            resp = self.session.get(url, timeout=10)
            resp.raise_for_status()
            html = resp.text
        except requests.RequestException as e:
            return {'error': f"Network error getting release info: {e}"}

        return parse_csdb_release_detail(html)

    def _search_help(self, query: str) -> str:
        """
        Provide help on how to search CSDB

        Args:
            query: Original query

        Returns:
            Help text
        """
        return """CSDB Search Usage:

c: release <id>  - Get release info
c: group <id>    - Get group info
c: scener <id>   - Get scener info
c: event <id>    - Get event info

Navigation:
c: find <text>   - Search for releases, groups, etc.
c: cd <type>     - Change directory (e.g., 'cd release')
c: cd <id>       - View details of an item
c: cd ..         - Go up one level
c: pwd           - Show current path
c: cp <file>     - Copy file from a release to local tmp
"""

    def _parse_and_execute(self, command: str, session_id: int) -> str:
        """
        Parse and execute a command in the context of a session's CSDB state.
        """
        state = get_session_state(session_id)
        parts = command.strip().split(maxsplit=1)
        cmd = parts[0].lower() if parts else ''
        arg = parts[1] if len(parts) > 1 else ''

        # PWD
        if cmd == 'pwd':
            path = "c:/"
            if state.get('active_dir'):
                path += state['active_dir']
            if state.get('active_id'):
                path += f"/{state['active_id']}"
            return path

        # LL / DIR
        if cmd in ['ll', 'dir']:
            if state.get('active_dir') and state.get('active_id'):
                return self._get_entry_info(state['active_dir'], state['active_id'], session_id)
            elif state.get('active_dir'):
                return self._get_latest(state['active_dir'])
            else:
                # At CSDB root, show next-level virtual folders
                folders = [
                    'group',
                    'release',
                    'scener',
                    'event',
                    'bbs',
                    'sid'
                ]
                return "\x9fCSDB root\x9a:\n" + '\n'.join(f"  - {name}" for name in folders) + "\n\nUse 'cd <type>' to enter a section."

        # CD
        if cmd == 'cd':
            if not arg:
                return "Usage: cd <type>, cd <id>, or cd /<type>/<id>"

            # Support 'cd /' to reset to CSDB root
            if arg.strip() == '/':
                state['active_dir'] = None
                state['active_id'] = None
                return "At CSDB root."

            # Aliases for cd <type>
            aliases = {
                'rel': 'release',
                'grp': 'group',
                'scn': 'scener'
            }
            arg_lower = arg.lower()
            if arg_lower in aliases:
                arg = aliases[arg_lower]

            # Handle path-like cd, e.g. /release/12345 or release/12345
            if arg.startswith('/'):
                path_parts = [p for p in arg.split('/') if p]
            else:
                path_parts = [p for p in arg.split('/') if p]
                if len(path_parts) >= 2:
                    # Treat as path-like without leading slash
                    pass
                else:
                    path_parts = []

            if path_parts:
                path_type = path_parts[0].lower()
                if path_type in aliases:
                    path_type = aliases[path_type]
                    path_parts[0] = path_type

                if len(path_parts) == 2 and path_type in ['release', 'group', 'scener', 'event', 'bbs', 'sid'] and path_parts[1].isdigit():
                    state['active_dir'] = path_type
                    state['active_id'] = int(path_parts[1])
                    return self._get_entry_info(state['active_dir'], state['active_id'], session_id)
                elif len(path_parts) == 3 and path_type == 'release' and path_parts[1].isdigit() and path_parts[2].isdigit():
                    state['active_dir'] = 'release'
                    state['active_id'] = int(path_parts[1])
                    # This is likely a zip file inside a release, attempt to cd into it
                    return self._cd_into_zip(int(path_parts[2]), session_id)
                else:
                    return f"Invalid path format: {arg}"
            # cd <type>
            if arg.lower() in ['release', 'group', 'scener', 'event', 'bbs', 'sid']:
                state['active_dir'] = arg.lower()
                state['active_id'] = None
                return f"Switched to {state['active_dir']} directory.\n"
            # cd <id>
            if arg.isdigit():
                if not state.get('active_dir'):
                    return "Cannot cd into an ID without a directory context. Use 'cd <type>' first."
                state['active_id'] = int(arg)
                return self._get_entry_info(state['active_dir'], state['active_id'], session_id)
            # cd <zip_file_id>
            if arg.lower().endswith('.zip') and state.get('active_dir') == 'release' and state.get('active_id'):
                release_info = self._get_parsed_release_info(state['active_id'])
                file_id = None
                for f in release_info.get('files', []):
                    if f['name'].lower() == arg.lower():
                        file_id = f['id']
                        break
                if file_id:
                    return self._cd_into_zip(file_id, session_id)
                else:
                    return f"Zip file '{arg}' not found in this release."

            return f"Invalid 'cd' argument: {arg}\n"

        # FIND / LS
        if cmd in ['find', 'ls']:
            search_text = arg if cmd == 'find' else (state.get('last_find', '') if 'ls' else '')
            if not search_text and not state.get('active_dir'):
                return "Usage: find <text>"
            state['last_find'] = search_text

            if state.get('active_dir'):
                # Search globally and filter section locally (CSDB filtered pages are harder to parse)
                result = self._find_csdb(search_text, seinsel="all")
                return self._format_find_result(result, custom_section=(
                    state['active_dir'], f"{state['active_dir']}s", state['active_dir']+'s', state['active_dir']+'_count'))
            else:
                # Global search
                result = self._find_csdb(search_text)
                return self._format_find_result(result)

        # CP
        if cmd == 'cp':
            if not arg:
                return "Usage: cp <file_pattern>"
            return self._cp_file(arg, session_id)

        # Direct queries (e.g., "release 123")
        if cmd in ['release', 'group', 'scener', 'event'] and arg.isdigit():
            return self._get_entry_info(cmd, int(arg), session_id)

        # Fallback to a general find
        return self._format_find_result(self._find_csdb(command))

    def _get_latest(self, entry_type: str, count: int = 10) -> str:
        """
        Get the latest entries for a given type from CSDB.
        For releases, it scrapes the latestreleases.php page.
        For other types, it returns a help message.
        """
        if entry_type == 'release':
            try:
                url = "https://csdb.dk/latestreleases.php"
                resp = self.session.get(url, headers=CSDB_BROWSER_HEADERS, timeout=10)
                resp.raise_for_status()
                releases = parse_latest_releases(resp.text)
                
                if not releases:
                    return "No latest releases found."

                output = [f"\x9f{len(releases)} latest releases\x9a:"]
                for rel in releases[:count]:
                    line = f"  \x9b{rel.get('id', 'N/A')}\x9a: {rel.get('name', 'N/A')}"
                    output.append(line)
                
                if len(releases) > count:
                    output.append(f"  (and {len(releases) - count} more...)")

                return '\n'.join(output)

            except requests.RequestException as e:
                return f"Error fetching latest releases: {e}"
            except Exception as e:
                logger.error(f"Error parsing latest releases: {e}")
                return "Error parsing latest releases."
        else:
            return f"cd <id> or find <name>"
