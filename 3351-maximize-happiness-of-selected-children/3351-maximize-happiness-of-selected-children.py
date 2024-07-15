class Solution(object):
    def maximumHappinessSum(self, happiness, k):
        """
        :type happiness: List[int]
        :type k: int
        :rtype: int
        """
        happiness.sort(reverse = True)
        answer = 0
        temp = 0

        while temp < k : 
            if happiness[temp] - temp > 0 : 
                answer += (happiness[temp] - temp)
            temp += 1

        return answer
            
        