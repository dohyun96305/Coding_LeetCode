class Solution(object):
    def minExtraChar(self, s, dictionary):
        """
        :type s: str
        :type dictionary: List[str]
        :rtype: int
        """
        dp = [0] + [float('inf')] * (len(s))
        
        wordSet = set(dictionary)
        
        for i in range(1, len(s)+1) :
            dp[i] = dp[i-1] + 1

            for j in range(0, i) :
                if s[j : i] in wordSet :
                    dp[i] = min(dp[i], dp[j])

        return dp[-1]
    
