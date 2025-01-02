class Solution:
    def jump(self, nums: List[int]) -> int:
        jump_cnt = [float('inf')] * (len(nums))
        jump_cnt[0] = 0 

        for i in range(len(nums)) : 
            for j in range(i, i + nums[i] + 1) :    
                if j < len(nums) : 
                    jump_cnt[j] = min(jump_cnt[j], jump_cnt[i] + 1) 

        return jump_cnt[-1]