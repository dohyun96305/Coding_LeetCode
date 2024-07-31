class Solution(object):
    def minCost(self, nums, costs):
        """
        :type nums: List[int]
        :type costs: List[int]
        :rtype: int
        """
        n = len(nums)
        inf = 1e99

        dp = [inf] * n
        dp[0] = 0

        temp_asc = []
        temp_desc = []

        for i in range(n) :
            while temp_asc and nums[i] < nums[temp_asc[-1]] : 
                dp[i] = min(dp[i], dp[temp_asc.pop()] + costs[i])

            while temp_desc and nums[i] >= nums[temp_desc[-1]] : 
                dp[i] = min(dp[i], dp[temp_desc.pop()] + costs[i])

            temp_asc.append(i)
            temp_desc.append(i)
            
        return dp[-1]

# can jump i to j
# 1. if nums[i] <= nums[j] and nums[k] < nums[i]
# 2. if nums[i] > nums[j] and nums[k] >= nums[i]
# costs[i] to jump to index i

# return minumum cost to jump to len(nums) - 1
