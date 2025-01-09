class Solution:
    def trap(self, height: List[int]) -> int:
        height_left = []
        height_right = []

        left_temp = 0
        for i in height :
            left_temp = max(left_temp, i)
            height_left.append(left_temp)

        right_temp = 0
        for i in height[::-1] : 
            right_temp = max(right_temp, i)
            height_right.append(right_temp)
        
        temp = [min(a, b) for a, b in zip(height_left, height_right[::-1])]
        
        return sum(b-a for a, b in zip(height, temp))