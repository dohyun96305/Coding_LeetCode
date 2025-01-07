class Solution:
    def hammingWeight(self, n: int) -> int:
        answer = 0
        temp = bin(n)[2:]
        for i in temp : 
            if i == '1' : 
                answer += 1

        return answer