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
        
        def add1(a, b, symbols) : 
            a_0, a_1 = a.split('/')
            b_0, b_1 = b.split('/')

            c_0 = str(int(a_0) * int(b_1) + symbols * (int(a_1) * int(b_0)))
            c_1 = str(int(a_1) * int(b_1))

            return c_0 + '/' + c_1

        symbols = list(map(lambda x: -1 if x == '-' else 1, re.findall(r'[-+]', expression)))[::-1]
        nums = list(re.split(r"[-+]", expression))[::-1]

        if not nums[-1] : 
            nums.pop()
            a_0, a_1 = nums.pop().split('/')
            a = str(symbols.pop() * int(a_0)) + '/' + a_1

        else : 
            a = nums.pop()
        
        while symbols : 
            b = nums.pop()
            a = add1(a, b, symbols.pop())
        
        a_0, a_1 = a.split('/')
        
        temp = gcd(int(a_0), int(a_1))

        return str(int(a_0) // temp) + '/' + str(int(a_1) // temp)