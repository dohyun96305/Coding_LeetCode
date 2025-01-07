class Solution:
    def romanToInt(self, s: str) -> int:
        values = {
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000,
        }

        answer = 0 
        cnt = 0
    
        while cnt < len(s) : 
            if cnt + 1 < len(s) and values[s[cnt]] < values[s[cnt + 1]] : 
                answer += (values[s[cnt + 1]] - values[s[cnt]])
                cnt += 2

            else : 
                answer += values[s[cnt]]
                cnt += 1

        return (answer)

        