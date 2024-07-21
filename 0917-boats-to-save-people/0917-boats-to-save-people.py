class Solution(object):
    def numRescueBoats(self, people, limit):
        """
        :type people: List[int]
        :type limit: int
        :rtype: int
        """
##### Each boat carries at most two people at the same time 

        people.sort()
        left, right = 0, len(people) - 1
        answer = 0

        while left <= right : 
            if people[left] + people[right] <= limit : 
                left += 1 

            right -= 1
            answer += 1
        
        return answer

        