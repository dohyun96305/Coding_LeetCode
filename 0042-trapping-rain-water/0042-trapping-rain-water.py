class Solution(object):
    def trap(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
        if len(height) < 3:
            return 0

        trap_water = 0
        left, right = 0, len(height) - 1
        l_max, r_max = height[left], height[right]

        while (left < right):
            l_max, r_max = max(l_max, height[left]), max(r_max, height[right])

            if l_max <= r_max:
                trap_water += l_max - height[left]
                left += 1

            else:
                trap_water += r_max - height[right]
                right -= 1

        return trap_water
