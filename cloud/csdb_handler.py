"""
CSDBHandler - Handles requests to csdb.dk database

Queries the CSDB.dk API for C64 scene information.
Processes requests starting with "c:"
"""

import logging
import os
import requests
import xml.etree.ElementTree as ET
from typing import Optional, List
from pydantic import BaseModel
from base_handler import BaseHandler
from dotenv import load_dotenv


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


class CSDBEvent(BaseModel):
    name: str
    start_date: str
    end_date: Optional[str] = None

# Load environment variables (override=True to prevent system vars from interfering)


load_dotenv(override=True)

logger = logging.getLogger(__name__)

# CSDB API base URL
CSDB_API_URL = "https://csdb.dk/webservice/"


class CSDBHandler(BaseHandler):
    """Handler for CSDB.dk database queries"""

    # Per-session state: session_id (int) -> state dict
    _session_states = {}

    @classmethod
    def get_session_state(cls, session_id: int):
        if session_id not in cls._session_states:
            cls._session_states[session_id] = {
                'active_module': None,   # e.g. 'c'
                'active_dir': None,      # e.g. 'group', 'release', etc.
                'active_id': None,       # e.g. 901 (if in detail)
                'last_find': None,       # last find result dict
                # type of last find (e.g. 'group', 'release', etc.)
                'last_find_type': None,
            }
        return cls._session_states[session_id]

    def __init__(self):
        """Initialize CSDBHandler"""
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'C64-Cloud-Server/1.0'
        })

        # Add authentication if available
        csdb_user = os.getenv('CSDB_USER')
        csdb_password = os.getenv('CSDB_PASSWORD')
        if csdb_user and csdb_password:
            self.session.auth = (csdb_user, csdb_password)
            logger.info(
                f"CSDB authentication configured for user: {csdb_user}")

    def can_handle(self, text: str, session_id: int = 0) -> bool:
        """
        Only handle if text starts with c:, or if c: is the active module for this session.
        """
        t = text.strip().lower()
        state = self.get_session_state(session_id)
        if t.startswith("c:"):
            return True
        # Only assume csdb module if user explicitly switched to it
        if state['active_module'] == 'c':
            # If user enters a known other module prefix, don't handle
            for prefix in ["i:", "help", "?", "h:"]:
                if t.startswith(prefix):
                    return False
            return True
        return False

    def handle(self, text: str, session_id: int = 0) -> str:
        """
        Process CSDB query or virtual navigation (cd/find/etc) for a session
        """
        t = text.strip()
        t_lower = t.lower()
        state = self.get_session_state(session_id)

        # If starts with c:, reset module and parse rest
        if t_lower.startswith("c:"):
            state['active_module'] = 'c'
            state['active_dir'] = None
            state['active_id'] = None
            state['last_find'] = None
            state['last_find_type'] = None
            query = t[2:].strip()
            if not query:
                return "CSDB module active"
            # If user enters e.g. c: group 123, c: find foo, etc, process as normal
            return self._process_csdb_command(query, session_id)

        # If c: is active module, interpret commands
        if state['active_module'] == 'c':
            # pwd command
            if t_lower == 'pwd':
                path = 'c:/'
                if state['active_dir']:
                    path += state['active_dir'] + '/'
                    if state['active_id']:
                        path += str(state['active_id'])
                return path
            # cd command
            if t_lower.startswith("cd "):
                path = t[3:].strip()
                # cd / - go to root
                if path == '/':
                    state['active_dir'] = None
                    state['active_id'] = None
                    return "c:/"
                # cd /<type>/<id> or /<type>
                if path.startswith('/'):
                    state['active_dir'] = None
                    state['active_id'] = None
                    path = path[1:]
                # cd .. - go up one level
                if path == '..':
                    if state['active_id']:
                        state['active_id'] = None
                        return f"c:/{state['active_dir']}"
                    elif state['active_dir']:
                        state['active_dir'] = None
                        return "c:/"
                    else:
                        return "c:/"  # Already at root
                # cd <type> - change directory type
                if path in ['release', 'group', 'scener', 'event', 'bbs', 'sid']:
                    state['active_dir'] = path
                    state['active_id'] = None
                    return f"c:/{path}"
                # cd <id> - go to item in current dir
                if path.isdigit() and state['active_dir']:
                    state['active_id'] = int(path)
                    return self._get_entry_info(state['active_dir'], state['active_id'])
                # cd <type>/<id>
                parts = path.split('/')
                if len(parts) == 2 and parts[0] in ['release', 'group', 'scener', 'event', 'bbs', 'sid'] and parts[1].isdigit():
                    state['active_dir'] = parts[0]
                    state['active_id'] = int(parts[1])
                    return self._get_entry_info(state['active_dir'], state['active_id'])
                return f"Invalid path: {path}"
            # find command
            if t_lower.startswith("find "):
                search_text = t[5:].strip()
                result = self._find_csdb(search_text)
                state['last_find'] = result
                state['active_id'] = None
                if state['active_dir']:
                    filtered = {}
                    type_map = {
                        'release': ('releases', 'release_count'),
                        'group': ('groups', 'group_count'),
                        'scener': ('sceners', 'scener_count'),
                        'bbs': ('bbses', 'bbs_count'),
                        'sid': ('sids', 'sid_count'),
                    }
                    key, count_key = type_map.get(
                        state['active_dir'], (None, None))
                    if key:
                        filtered[key] = result.get(key, [])
                        filtered[count_key] = result.get(count_key, 0)
                        section = state['active_dir'] + \
                            (" matches" if state['active_dir']
                             != 'bbs' else " match")
                        show_all_label = key
                        return self._format_find_result(filtered, custom_section=(section, show_all_label, key, count_key))
                return self._format_find_result(result)
            # cd <id> without dir
            if t_lower.startswith("cd ") and t[3:].strip().isdigit():
                return "Please 'cd' into a type first (e.g. 'cd group') before 'cd <id>'"
            # If user enters e.g. group 123, release 456, etc
            parts = t.strip().split()
            if len(parts) == 2 and parts[0] in ['group', 'release', 'scener', 'event', 'bbs', 'sid'] and parts[1].isdigit():
                state['active_dir'] = parts[0]
                state['active_id'] = int(parts[1])
                return self._process_csdb_command(t, session_id)
            # If user enters just a number and in a dir, treat as cd <id>
            if t.isdigit() and state['active_dir']:
                state['active_id'] = int(t)
                return self._process_csdb_command(f"{state['active_dir']} {t}", session_id)
            # Help
            if t_lower in ['help', '?']:
                return self._search_help("")
            # Otherwise, unknown command
            return "Unknown CSDB command. Use 'find <text>', 'cd <type>', or 'cd <id>'."

        # Fallback: not handled
        return "Unknown command. Type 'help' for available commands."

    def _process_csdb_command(self, query: str, session_id: int = 0) -> str:
        """
        Parse and execute a CSDB command string (e.g. 'group 123', 'find foo', etc) for a session
        """
        try:
            result = self._query_csdb(query)
            return result
        except Exception as e:
            logger.error(f"Error querying CSDB: {e}")
            return f"Error: {str(e)}"

    def _format_find_result(self, result: dict, custom_section=None) -> str:
        """
        Format a find result dict as text (same as _find_csdb output)
        If custom_section is provided, only format that section: (section, show_all_label, key, count_key)
        """
        if 'error' in result:
            return result['error']

        def fmt_items(items, count, section, show_all_label):
            lines = []
            if count:
                lines.append(f"{count}   {section}:")
                for item in items[:5]:
                    id_str = str(item.get('id', ''))
                    txt = item.get('text', '')
                    line = f"{id_str:<6}{txt}"[:40]
                    lines.append(line)
                if count > 5:
                    lines.append(
                        f"Show all {count} matching {show_all_label}"[:40])
            return lines
        output = []
        if custom_section:
            section, show_all_label, key, count_key = custom_section
            output += fmt_items(result.get(key, []),
                                result.get(count_key, 0), section, show_all_label)
        else:
            output += fmt_items(result.get('releases', []),
                                result.get('release_count', 0), 'release matches', 'releases')
            output += fmt_items(result.get('groups', []),
                                result.get('group_count', 0), 'group match', 'groups')
            output += fmt_items(result.get('sceners', []),
                                result.get('scener_count', 0), 'scener matches', 'sceners')
            output += fmt_items(result.get('bbses', []),
                                result.get('bbs_count', 0), 'BBS match', 'BBSes')
            output += fmt_items(result.get('sids', []),
                                result.get('sid_count', 0), 'SID matches', 'SIDs')
        return '\n'.join(output) if output else "No results found."

    def _query_csdb(self, query: str) -> str:
        """
        Query CSDB API

        Args:
            query: Search query

        Returns:
            Formatted response text
        """
        parts = query.strip().split()
        if len(parts) >= 2:
            cmd = parts[0].lower()
            if cmd in ['release', 'group', 'scener', 'event', 'bbs', 'sid']:
                try:
                    entry_id = int(parts[1])
                    return self._get_entry_info(cmd, entry_id)
                except ValueError:
                    pass
            elif cmd == 'find':
                search_text = ' '.join(parts[1:])
                return self._find_csdb(search_text)
        # For general queries, provide guidance
        return self._search_help(query)

    def _find_csdb(self, search_text: str) -> dict:
        """
        Perform CSDB find (HTML search) and return parsed result dict
        """
        from csdb_search_parser import parse_csdb_find
        import requests
        url = f"https://csdb.dk/search/?seinsel=all&search={search_text}&Go.x=8&Go.y=9"
        try:
            resp = requests.get(url, timeout=10)
            result = parse_csdb_find(resp.text)
            return result
        except Exception as e:
            return {'error': f"Network error: {str(e)}"}

    def _get_entry_info(self, entry_type: str, entry_id: int, depth: int = 2) -> str:
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
                line = f"{member_id:<6} {details}"
                lines.append(line[:40])
            return '\n'.join(lines)

        def format_release_output(release_data: dict, entry_id: int) -> str:
            """Format release output from HTML parser data"""

            output = []
            # Add release name as heading if present
            release_name = release_data.get('name')
            if release_name:
                output.append(f"{release_name}")

            # Released by: group_id    group_name
            if release_data.get('groups'):
                groups_parts = []
                for group in release_data['groups']:
                    group_id = group.get('id', '')
                    group_name = group.get('name', '')
                    if group_id and group_name:
                        groups_parts.append(f"{group_id} {group_name}")
                if groups_parts:
                    output.append(f"Released by: {', '.join(groups_parts)}")

            # Release Date
            if release_data.get('release_date'):
                output.append(f"Release Date: {release_data['release_date']}")

            # Type
            if release_data.get('type'):
                output.append(f"Type: {release_data['type']}")

            # User rating
            if release_data.get('user_rating'):
                output.append(f"User rating: {release_data['user_rating']}")

            # Files
            files = release_data.get('files', [])
            if files:
                output.append("Files:")
                for file_info in files:
                    file_id = file_info.get('id', '')
                    file_name = file_info.get('name', '')
                    downloads = file_info.get('downloads', '')
                    if file_id and file_name:
                        file_line = f"{file_id} {file_name}"
                        if downloads:
                            file_line += f" ({downloads})"
                        output.append(file_line)

            return '\n'.join(output)

        def format_scener_output(model: CSDBScener) -> str:
            result = f"Handle: {model.handle}\n"
            if model.real_name:
                result += f"Name: {model.real_name}\n"
            if model.groups:
                result += f"Groups: {', '.join(model.groups)}"
            return result

        def format_event_output(model: CSDBEvent) -> str:
            result = f"Event: {model.name}\n"
            result += f"Start: {model.start_date}\n"
            if model.end_date and model.end_date != model.start_date:
                result += f"End: {model.end_date}"
            return result

        def format_group_output(group_data: dict, entry_id: int) -> str:
            name = group_data.get('name', f"Group {entry_id}")
            abbr = group_data.get('abbreviation')
            country = group_data.get('country')
            group_type = group_data.get('group_type')
            user_rating = group_data.get('user_rating')
            # Compose the first line: name (abbr) [country]
            first_line = f"{name}"
            if abbr:
                first_line += f" ({abbr})"
            if country:
                first_line += f" [{country}]"
            output = [first_line]
            type_rating_line = None
            if group_type and user_rating:
                type_rating_line = f"Type: {group_type} | Rating: {user_rating}"
            elif group_type:
                type_rating_line = f"Type: {group_type}"
            elif user_rating:
                type_rating_line = f"Rating: {user_rating}"
            if type_rating_line:
                output.append(type_rating_line)
            output.append("")
            # Only add 'All Members:' if there are members
            members = group_data.get('members', [])
            if members:
                output.append("All Members:")
                output.append(format_members(members))
                output.append("")

            # Add 'Releases' section if present
            releases = group_data.get('releases', [])
            if releases:
                output.append(f"Releases: ({len(releases)})")

                def format_release(r):
                    title = r.get('title', 'Unknown')
                    year = r.get('year')
                    release_type = r.get('type')
                    release_id = r.get('id', '')

                    year_str = f"({year})" if year else ""
                    type_str = f"[{release_type}]" if release_type else ""

                    # Format: id (padded) title (year) [type]
                    full_title = f"{title} {year_str} {type_str}".strip()
                    line = f"{release_id:<6} {full_title}"
                    return line[:40]

                for rel in releases:
                    output.append(format_release(rel))
                output.append("")
            return '\n'.join(output)
        """
        Get information for a specific CSDB entry
        For 'group' and 'release', use HTML parser for detailed information.
        """
        if entry_type == 'group':
            try:
                from csdb_group_parser import parse_csdb_group_detail
                url = f"https://csdb.dk/group/?id={entry_id}"
                logger.info(f"Fetching group HTML for id {entry_id}: {url}")
                resp = self.session.get(url, timeout=10)
                resp.raise_for_status()
                group_data = parse_csdb_group_detail(resp.text)
                return format_group_output(group_data, entry_id)
            except Exception as e:
                logger.error(f"Error fetching/parsing group HTML: {e}")
                return f"Error fetching group details: {str(e)}"

        if entry_type == 'release':
            try:
                from csdb_release_parser import parse_csdb_release_detail
                url = f"https://csdb.dk/release/?id={entry_id}"
                logger.info(f"Fetching release HTML for id {entry_id}: {url}")
                resp = self.session.get(url, timeout=10)
                resp.raise_for_status()
                release_data = parse_csdb_release_detail(resp.text)
                return format_release_output(release_data, entry_id)
            except Exception as e:
                logger.error(f"Error fetching/parsing release HTML: {e}")
                return f"Error fetching release details: {str(e)}"

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
                    groups=groups
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

Example:
c: release 1234

Note: IDs can be found by browsing csdb.dk
Full text search coming soon!"""
