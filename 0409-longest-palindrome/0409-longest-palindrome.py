class Solution(object):
    def longestPalindrome(self, s):
        """
        :type s: str
        :rtype: int
        """
        s_count = {x : 0 for x in s}
        answer = 0

        for i in s : 
            s_count[i] += 1

        for i in s_count.values():
            answer += int(i/2)*2
            if answer % 2 == 0 and i % 2 == 1:
                answer += 1

        return answer      