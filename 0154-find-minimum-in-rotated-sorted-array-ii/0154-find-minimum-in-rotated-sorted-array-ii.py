class Solution(object):
    def findMin(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        
        left, right = 0, len(nums) - 1

        while left < right : 
            mid = (left+right) // 2

            if nums[mid] > nums[right] : 
                left = mid + 1

            elif nums[mid] < nums[left] :
                right = mid 

            else : 
                right -= 1
                
        return nums[left]
            