class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort()
        
        i = 1
        start, end = intervals[0]
        temp = []

        while i < len(intervals) : 
            a, b = intervals[i]

            if end >= a : 
                end = max(end, b)

            else : 
                temp.append([start, end])
                start, end = a, b
        
            i += 1 

        temp.append([start, end])

        return temp