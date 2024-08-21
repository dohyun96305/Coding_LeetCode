class Solution(object):
    def firstMissingPositive(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        
        hash = {}
        temp = 0

        nums = list(set(nums))
        nums.sort()

        for i in nums : 
            if i <= 0 : 
                pass 
            else : 
                if i == temp + 1 : 
                    temp = i
                else : 
                    break

        return temp + 1
                
      