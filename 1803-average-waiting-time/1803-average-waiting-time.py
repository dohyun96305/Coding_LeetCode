class Solution(object):
    def averageWaitingTime(self, customers):
        """
        :type customers: List[List[int]]
        :rtype: float
        """
        time = customers[0][0]
        temp = 0.0

        for a, b in customers : 
            if time > a : 
                temp += (time + b - a)
            else : 
                time = a
                temp += b    
            time += b 

        return temp / len(customers)
        