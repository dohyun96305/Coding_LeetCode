class Solution(object):
    def maxDistance(self, arrays):
        """
        :type arrays: List[List[int]]
        :rtype: int
        """

        min1 = arrays[0][0]
        max1 = arrays[0][-1]
        max_dist = 0

        for i in range(1, len(arrays)) : 
            max_dist = max(max_dist, abs(max1 - arrays[i][0]), abs(arrays[i][-1] - min1))

            min1 = min(min1, arrays[i][0])
            max1 = max(max1, arrays[i][-1])

        return max_dist
        
# Each array is sorted in ASC
# Pick up two integers from two different arrays, calculate the distnace, ABS
# Return maximum distance 