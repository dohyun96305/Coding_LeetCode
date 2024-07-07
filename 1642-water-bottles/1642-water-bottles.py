class Solution(object):
    def numWaterBottles(self, numBottles, numExchange):
        """
        :type numBottles: int
        :type numExchange: int
        :rtype: int
        """
        answer = 0
        temp_full, temp_empty = 0, 0

        while True : 
            answer += numBottles
            a, b = divmod(numBottles, numExchange)
            
            temp_full = a
            temp_empty += b

            c, d = divmod(temp_empty, numExchange)

            if c > 0 : 
                temp_full += c
                temp_empty = d

            if temp_full != 0 : 
                numBottles = temp_full
            else : 
                break

        return answer