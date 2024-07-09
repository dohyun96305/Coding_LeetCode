class Solution(object):
    def averageWaitingTime(self, customers):
        """
        :type customers: List[List[int]]
        :rtype: float
        """
        time = customers[0][0]
        answer = 0.0

        for x in customers : 
            if time > x[0] : 
                answer += (time + x[1] - x[0])
            else : 
                time = x[0]
                answer += x[1]

            time += x[1]

        return answer / len(customers)
        