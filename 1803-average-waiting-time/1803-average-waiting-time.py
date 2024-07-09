class Solution(object):
    def averageWaitingTime(self, customers):
        """
        :type customers: List[List[int]]
        :rtype: float
        """
        time = customers[0][0]
        answer = 0.0

        for a, b in customers : 
            if time > a : 
                answer += (time + b - a)
            else : 
                time = a
                answer += b

            time += b 

        return answer / len(customers)
        