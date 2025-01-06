class Solution:
    def reverseBits(self, n: int) -> int:
        temp = (32 - len(bin(n)[2:])) * '0' + bin(n)[2:]
 
        return int(temp[::-1], 2)
