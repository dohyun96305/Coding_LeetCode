class Solution(object):
    def subsets(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        answer = []
        curr = []
        self.generate(nums, 0, curr, answer)
        return answer

    def generate(self, nums, index, curr, answer) : 
        if index == len(nums) : 
            answer.append(curr[:])
            return 
        
        self.generate(nums, index+1, curr, answer)
        curr.append(nums[index])
        self.generate(nums, index+1, curr, answer)
        curr.pop()