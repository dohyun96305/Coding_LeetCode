class Solution(object):
    def maxDistance(self, position, m):
        """
        :type position: List[int]
        :type m: int
        :rtype: int
        """
        position.sort()
        answer = 0

        def check(num1) : 
            prev = position[0]
            count = 1

            for i in range(1, len(position)) : 
                if position[i] - prev >= num1 : 
                    prev = position[i]
                    count += 1
                
                if count == m : 
                    return True
                
            return False

        left, right = 0, (position[-1] - position[0])

        while left <= right : 
            mid = (left + right) // 2

            if check(mid) : 
                answer = mid
                left = mid + 1
            else : 
                right = mid - 1

        return answer