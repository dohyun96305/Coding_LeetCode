class Solution(object):
    def passThePillow(self, n, time):
        """
        :type n: int
        :type time: int
        :rtype: int
        """
        temp = ((n-1) * 2) 
        temp_n = time % temp
        print(temp_n)
        
        if temp_n < n : 
            return temp_n + 1
        else : 
            return n - (temp_n - n) - 1
