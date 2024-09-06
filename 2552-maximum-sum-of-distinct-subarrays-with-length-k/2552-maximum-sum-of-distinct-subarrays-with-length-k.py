class Solution(object):
    def maximumSubarraySum(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        curr_count = {}                 # Saving current k window list frequency of number in nums[:k]
        curr_sum = sum(nums[:k])        # current sum
        max_sum = 0                 

        for num1 in nums[:k] :          # Check frequency
            if num1 in curr_count : 
                curr_count[num1] += 1
            else : 
                curr_count[num1] = 1

        if len(curr_count) == k :               # If no duplicates number in k window list
            max_sum = max(max_sum, curr_sum)    # Update max_sum

        for i in range(k, len(nums)) :          # Update Frequency 
            out_nums = nums[i-k]
            in_nums = nums[i]

            if curr_count[out_nums] == 1 : 
                del curr_count[out_nums]
            else : 
                curr_count[out_nums] -= 1

            if in_nums in curr_count : 
                curr_count[in_nums] += 1
            else : 
                curr_count[in_nums] = 1

            curr_sum = curr_sum - out_nums + in_nums    # Update current sum

            if len(curr_count) == k :                   # If no duplicate in current window k list, update maximum sum
                max_sum = max(max_sum, curr_sum)

        return max_sum