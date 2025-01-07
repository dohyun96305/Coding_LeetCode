class Solution:
    def intToRoman(self, num: int) -> str:
        digits = dict([
            (1000, "M"),
            (900, "CM"),
            (500, "D"),
            (400, "CD"),
            (100, "C"),
            (90, "XC"),
            (50, "L"),
            (40, "XL"),
            (10, "X"),
            (9, "IX"),
            (5, "V"),
            (4, "IV"),
            (1, "I"),
        ])
        
        cnt = 1
        answer = []

        while num : 
            temp = num % 10 * cnt

            if temp in digits.keys() : 
                answer.append(digits[temp])

            else : 
                temp_val = temp // cnt
                if temp_val < 5 : 
                    answer.append(digits[cnt] * (temp_val))

                else : 
                    answer.append(digits[cnt * 5] + digits[cnt] * (temp_val - 5))

            num //= 10
            cnt *= 10

        return (''.join(answer[::-1]))

