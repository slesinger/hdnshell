

from pydantic import validate_call


class Petscii:
    """
    A class for converting between PETSCII and ASCII character encodings.
    """

    @staticmethod
    @validate_call
    def petscii2ascii(p_byte: int) -> int:
        """
        Converts a single PETSCII byte to an ASCII byte.
        Simple direct mapping based on PETSCII-ASCII conversion table.
        """
        # PETSCII $C1–$DA → ASCII $41–$5A (A–Z)
        if 0xC1 <= p_byte <= 0xDA:  # PETSCII A-Z
            return p_byte - 0x80
        # PETSCII $41–$5A → ASCII $61–$7A (a–z)
        elif 0x41 <= p_byte <= 0x5A:  # PETSCII a-z
            return p_byte + 0x20
        # Everything else maps directly
        return p_byte

    @staticmethod
    @validate_call
    def ascii2petscii(a_byte: int) -> int:
        """
        Converts a single ASCII byte to a PETSCII byte.
        Simple direct mapping based on ASCII-PETSCII conversion table.
        """
        # ASCII $41–$5A (A–Z) → PETSCII $C1–$DA
        if 0x41 <= a_byte <= 0x5A:  # A-Z
            return a_byte + 0x80
        # ASCII $61–$7A (a–z) → PETSCII $41–$5A
        elif 0x61 <= a_byte <= 0x7A:  # a-z
            return a_byte - 0x20
        # Everything else maps directly
        return a_byte
