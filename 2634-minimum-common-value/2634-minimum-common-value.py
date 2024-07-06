class Solution(object):
    def getCommon(self, nums1, nums2):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :rtype: int
        """
        nums1.sort()
        nums2.sort()
        i, j = 0, 0

        while i < len(nums1) and j < len(nums2) : 
            if nums1[i] == nums2[j] : 
                return nums1[i]
            else : 
                if nums1[i] > nums2[j] :
                    j += 1
                else : 
                    i += 1

        return -1

            
        