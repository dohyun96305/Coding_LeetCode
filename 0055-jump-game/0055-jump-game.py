class Solution:
    def canJump(self, nums: List[int]) -> bool:
        
        temp_val = 0

        for i in range(len(nums)) : 
            if i > temp_val : 
                return False

            temp_val = max(i + nums[i], temp_val)

            if temp_val >= len(nums) - 1 : 
                return True

        return False 
        
        