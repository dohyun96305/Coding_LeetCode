class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        temp = {}

        for i, val in enumerate(nums) : 
            if val in temp and i - temp[val] <= k : 
                return True

            else : 
                temp[val] = i

        return False        