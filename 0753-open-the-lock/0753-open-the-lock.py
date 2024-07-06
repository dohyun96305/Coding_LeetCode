class Solution(object):
    def openLock(self, deadends, target):
        """
        :type deadends: List[str]
        :type target: str
        :rtype: int
        """

        if '0000' in deadends : 
            return -1

        def turn_digit(num1) : 
            temp = []

            for i in range(4): 
                k_plus = str((int(num1[i])+1) % 10)
                k_minus = str((int(num1[i])-1) % 10)

                num1_plus = num1[:i] + k_plus + num1[i+1:]
                num1_minus = num1[:i] + k_minus + num1[i+1:] 

                temp.append(num1_plus)
                temp.append(num1_minus)

            return temp

        temp = deque()
        temp.append(['0000', 0])
        deadends = set(deadends)

        while temp : 
            digit, turn = temp.popleft()

            if digit == target : 
                return turn 

            for a in turn_digit(digit) : 
                if a not in deadends :
                    deadends.add(a)
                    temp.append([a, turn+1])

        return -1