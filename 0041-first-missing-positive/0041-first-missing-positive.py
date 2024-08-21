class Solution(object):
    def firstMissingPositive(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """

        # Cycle Sort
        def swap(i,j):
            nums[i],nums[j] = nums[j],nums[i]
        i = 0

        while(i<len(nums)):
            if(0<nums[i]<=len(nums) and nums[i] != nums[nums[i]-1] and nums[i] != i):
                swap(i,nums[i]-1)
        
            else:
                i+=1
        count = 1
        for i in range(len(nums)):
            if(count == nums[i]):
                count+=1
        return count