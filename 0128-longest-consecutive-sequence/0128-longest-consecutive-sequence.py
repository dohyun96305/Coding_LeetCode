class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        if not nums : 
            return 0 

        nums.sort()
        n = len(nums)
        dp = [1] * (n + 1)

        for i in range(1, n) : 
            if nums[i] == nums[i - 1] + 1 : 
                dp[i + 1] = max(dp[i + 1], dp[i] + 1)

            elif nums[i] == nums[i-1] : 
                dp[i + 1] = dp[i]
        
        return max(dp)

        
        