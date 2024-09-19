class Solution(object):
    def equalSubstring(self, s, t, maxCost):
        """
        :type s: str
        :type t: str
        :type maxCost: int
        :rtype: int
        """

        temp_ans = []
        answer = 0

        for a, b in zip(s, t) : 
            temp_ans.append(abs(ord(b)-ord(a)))
    
        maxCost_temp = maxCost
        temp = 0
        min_ind = 0
        max_length = 0

        for max_ind in range(len(s)):
            maxCost_temp -= temp_ans[max_ind]
            temp += 1
            
            while maxCost_temp < 0:
                maxCost_temp += temp_ans[min_ind]
                min_ind += 1
                temp -= 1

            max_length = max(max_length, temp)

        return max_length 