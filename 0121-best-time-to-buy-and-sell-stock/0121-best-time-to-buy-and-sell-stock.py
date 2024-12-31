class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        min_val = prices[0]
        answer = 0

        for i in range(1, len(prices)) : 
            if prices[i] < min_val : 
                min_val = prices[i]
            else : 
                answer = max(answer, prices[i] - min_val)

        return answer
        