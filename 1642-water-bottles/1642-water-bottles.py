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
            temp_full = numBottles // numExchange

            temp_empty += numBottles % numExchange

            if temp_empty // numExchange > 0 : 
                temp_full += temp_empty // numExchange
                temp_empty = temp_empty % numExchange

            if temp_full != 0 : 
                numBottles = temp_full
            else : 
                break

        return answer


        