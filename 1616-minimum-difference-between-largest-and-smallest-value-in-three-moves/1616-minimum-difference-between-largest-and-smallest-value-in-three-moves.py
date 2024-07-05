# Minimum Difference Between Largest and Smallest Value in Three Moves 
# https://leetcode.com/problems/minimum-difference-between-largest-and-smallest-value-in-three-moves/description/

# minumum difference between largest and smallest value, performing at most three moves (making any values)

class Solution(object):
    def minDifference(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        if len(nums) <= 4 : 
            return 0

        else : 
            nums.sort() # Time complexity ( O(NlogN) )
            min1 = float('inf')

            for i in range(4) : # Making window length 3, either delete min_values or max_values of nums
                min1 = min(min1, nums[len(nums) - 4 + i] - nums[i])

            return min1
