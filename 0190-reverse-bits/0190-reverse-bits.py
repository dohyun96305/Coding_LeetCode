class Solution:
    def reverseBits(self, n: int) -> int:
        temp = (32 - len(bin(n)[2:])) * '0' + bin(n)[2:]
        count = 0
        answer = 0 

        for i in temp : 
            if i == '1' : 
                answer += (2 ** count)

            count += 1

        return answer
