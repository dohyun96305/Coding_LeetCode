class Solution(object):
    cache = {0:0, 1:1, 2:2}

    def minDays(self, n):
        """
        :type n: int
        :rtype: int
        """

        if n not in self.cache:
            self.cache[n] = 1 + min(self.minDays(n//3) + n%3, self.minDays(n//2) + n%2)
        
        return self.cache[n]
