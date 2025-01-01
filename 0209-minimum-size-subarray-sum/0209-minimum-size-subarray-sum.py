# sum is greater than or equal to target

class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        left  = 0 
        min_len = float('inf')
        temp = 0 

        for right in range(len(nums)) : 
            temp += nums[right]

            while temp >= target : 
                if right - left + 1 < min_len : 
                    min_len = right - left + 1

                temp -= nums[left]
                left += 1

        return min_len if min_len != float('inf') else 0 


