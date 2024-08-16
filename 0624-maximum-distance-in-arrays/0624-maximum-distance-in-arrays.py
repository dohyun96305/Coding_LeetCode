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
            temp = arrays[i]
            max_dist = max(max_dist, abs(max1 - temp[0]), abs(temp[-1] - min1))

            min1 = min(min1, temp[0])
            max1 = max(max1, temp[-1])

        return max_dist
        
# Each array is sorted in ASC
# Pick up two integers from two different arrays, calculate the distnace, ABS
# Return maximum distance 