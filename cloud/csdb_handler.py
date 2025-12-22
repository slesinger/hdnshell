"""
CSDBHandler - Handles requests to csdb.dk database

Queries the CSDB.dk API for C64 scene information.
Processes requests starting with "c:"
"""
import logging
import os
import requests
import xml.etree.ElementTree as ET
from typing import Optional, Dict, Any
from base_handler import BaseHandler
from dotenv import load_dotenv

# Load environment variables (override=True to prevent system vars from interfering)
load_dotenv(override=True)

logger = logging.getLogger(__name__)

# CSDB API base URL
CSDB_API_URL = "https://csdb.dk/webservice/"


class CSDBHandler(BaseHandler):
    """Handler for CSDB.dk database queries"""

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
            logger.info(f"CSDB authentication configured for user: {csdb_user}")

    def can_handle(self, text: str) -> bool:
        """
        Check if text starts with "c:"

        Args:
            text: UTF-8 text to check

        Returns:
            True if text starts with "c:" (case-insensitive)
        """
        return text.strip().lower().startswith("c:")

    def handle(self, text: str) -> str:
        """
        Process CSDB query

        Args:
            text: UTF-8 text (should start with "c:")

        Returns:
            UTF-8 response text
        """
        # Remove "c:" prefix
        query = text.strip()[2:].strip()

        if not query:
            return "Please provide a search query after 'c:'"

        logger.info(f"CSDB query: {query}")

        try:
            # Parse query to determine what to search for
            result = self._query_csdb(query)
            return result

        except Exception as e:
            logger.error(f"Error querying CSDB: {e}")
            return f"Error: {str(e)}"

    def _query_csdb(self, query: str) -> str:
        """
        Query CSDB API

        Args:
            query: Search query

        Returns:
            Formatted response text
        """
        # Check for specific ID queries (e.g., "release 12345")
        parts = query.lower().split()

        if len(parts) >= 2 and parts[0] in ['release', 'group', 'scener', 'event', 'bbs', 'sid']:
            entry_type = parts[0]
            try:
                entry_id = int(parts[1])
                return self._get_entry_info(entry_type, entry_id)
            except ValueError:
                pass

        # For general queries, provide guidance
        return self._search_help(query)

    def _get_entry_info(self, entry_type: str, entry_id: int, depth: int = 2) -> str:
        """
        Get information for a specific CSDB entry

        Args:
            entry_type: Type of entry (release, group, scener, event, bbs, sid)
            entry_id: CSDB ID of the entry
            depth: Recursion depth for API call (default 2, max 4)

        Returns:
            Formatted entry information
        """
        try:
            # Build API URL
            params = {
                'type': entry_type,
                'id': entry_id,
                'depth': min(depth, 4)  # Max depth is 4
            }

            logger.info(f"Fetching {entry_type} {entry_id} from CSDB")

            response = self.session.get(CSDB_API_URL, params=params, timeout=10)
            response.raise_for_status()

            # Parse XML response
            root = ET.fromstring(response.content)

            # Format based on entry type
            if entry_type == 'release':
                return self._format_release(root)
            elif entry_type == 'group':
                return self._format_group(root)
            elif entry_type == 'scener':
                return self._format_scener(root)
            elif entry_type == 'event':
                return self._format_event(root)
            else:
                # Generic format
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

    def _format_release(self, root: ET.Element) -> str:
        """Format release information"""
        try:
            name = root.findtext('.//Release/Name', 'Unknown')
            release_type = root.findtext('.//Release/Type', 'Unknown')
            release_date = root.findtext('.//Release/ReleaseDate', 'Unknown')

            # Get group info
            groups = []
            for group in root.findall('.//Release/ReleasedBy/Group'):
                group_name = group.findtext('Name', 'Unknown')
                groups.append(group_name)

            groups_str = ', '.join(groups) if groups else 'Unknown'

            result = f"Release: {name}\n"
            result += f"Type: {release_type}\n"
            result += f"Date: {release_date}\n"
            result += f"By: {groups_str}"

            return result

        except Exception as e:
            logger.error(f"Error formatting release: {e}")
            return "Error formatting release information"

    def _format_group(self, root: ET.Element) -> str:
        """Format group information"""
        try:
            name = root.findtext('.//Group/Name', 'Unknown')

            # Get member count
            members = root.findall('.//Group/Members/Member')
            member_count = len(members)

            # Get release count
            releases = root.findall('.//Group/Releases/Release')
            release_count = len(releases)

            result = f"Group: {name}\n"
            result += f"Members: {member_count}\n"
            result += f"Releases: {release_count}"

            return result

        except Exception as e:
            logger.error(f"Error formatting group: {e}")
            return "Error formatting group information"

    def _format_scener(self, root: ET.Element) -> str:
        """Format scener information"""
        try:
            handle = root.findtext('.//Scener/Handle', 'Unknown')
            real_name = root.findtext('.//Scener/RealName', '')

            # Get groups
            groups = []
            for group in root.findall('.//Scener/Groups/Group'):
                group_name = group.findtext('Name', 'Unknown')
                groups.append(group_name)

            result = f"Handle: {handle}\n"
            if real_name:
                result += f"Name: {real_name}\n"
            if groups:
                result += f"Groups: {', '.join(groups)}"

            return result

        except Exception as e:
            logger.error(f"Error formatting scener: {e}")
            return "Error formatting scener information"

    def _format_event(self, root: ET.Element) -> str:
        """Format event information"""
        try:
            name = root.findtext('.//Event/Name', 'Unknown')
            start_date = root.findtext('.//Event/StartDate', 'Unknown')
            end_date = root.findtext('.//Event/EndDate', '')

            result = f"Event: {name}\n"
            result += f"Start: {start_date}\n"
            if end_date and end_date != start_date:
                result += f"End: {end_date}"

            return result

        except Exception as e:
            logger.error(f"Error formatting event: {e}")
            return "Error formatting event information"

    def _format_generic(self, root: ET.Element) -> str:
        """Generic XML formatting"""
        return "Entry found (generic format not yet implemented)"

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
