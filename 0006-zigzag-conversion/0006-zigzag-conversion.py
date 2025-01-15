class Solution:
    def convert(self, s: str, numRows: int) -> str:
        # Handle edge case where zigzag conversion isn't needed
        if numRows == 1 or numRows >= len(s):
            return s

        # Initialize a list of empty strings for each row
        rows = [""] * numRows
        current_row = 0
        direction = -1  # Used to reverse direction when reaching top or bottom

        for char in s:
            rows[current_row] += char
            # Change direction if we hit the top or bottom row
            if current_row == 0 or current_row == numRows - 1:
                direction *= -1
            current_row += direction

        # Join all rows to form the final converted string
        return "".join(rows)