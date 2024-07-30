class Solution(object):
    def makePalindrome(self, s):
        """
        :type s: str
        :rtype: bool
        """
        start, end = 0, (len(s) - 1)
        count = 0

        while start <= end : 
            if s[start] != s[end] : 
                count += 1

            if count > 2 : 
                return False
            
            start += 1
            end -= 1

        return True