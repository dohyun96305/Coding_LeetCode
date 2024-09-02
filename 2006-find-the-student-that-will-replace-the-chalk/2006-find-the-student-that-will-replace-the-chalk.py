class Solution(object):
    def chalkReplacer(self, chalk, k):
        """
        :type chalk: List[int]
        :type k: int
        :rtype: int
        """

        k = k % sum(chalk)

        while k >= 0 : 
            for i in range(len(chalk)) : 
                k -= chalk[i] 
                if k < 0 : 
                    return i
