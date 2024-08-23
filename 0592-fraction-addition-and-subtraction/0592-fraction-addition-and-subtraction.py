class Solution(object):
    def fractionAddition(self, expression):
        """
        :type expression: str
        :rtype: str
        """
        def gcd(a, b):
            while b != 0:
                a, b = b, a % b
            return abs(a)
        
        def add1(a_0, a_1, b_0, b_1, symbol):
            c_0 = a_0 * b_1 + symbol * a_1 * b_0
            c_1 = a_1 * b_1

            return c_0, c_1

        symbols = list(map(lambda x: -1 if x == '-' else 1, re.findall(r'[-+]', expression)))
        nums = re.split(r"[-+]", expression)

        a_0, a_1 = 0, 1
        
        for i, num in enumerate(nums):
            if num:
                b_0, b_1 = map(int, num.split('/'))
                symbol = symbols[i-1] if i > 0 else 1
                a_0, a_1 = add1(a_0, a_1, b_0, b_1, symbol)

        temp = gcd(a_0, a_1)

        return str(int(a_0) // temp) + '/' + str(int(a_1) // temp)