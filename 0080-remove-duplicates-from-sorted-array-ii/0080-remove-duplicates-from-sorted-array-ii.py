class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        temp = {}
        k = 0 

        for i in range(len(nums)) : 
            if nums[i] not in temp.keys() : 
                temp[nums[i]] = 1 

            else : 
                temp[nums[i]] += 1

                if temp[nums[i]] > 2 :
                    k -= 1 

            nums[k] = nums[i]
            k += 1

        nums[:] = nums[:k]