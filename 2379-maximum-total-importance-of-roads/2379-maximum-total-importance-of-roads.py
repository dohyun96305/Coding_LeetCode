class Solution(object):
    def maximumImportance(self, n, roads):
        """
        :type n: int
        :type roads: List[List[int]]
        :rtype: int
        """
        answer = 0
        temp = [[x, 0] for x in range(n)]

        for a, b in roads : 
            temp[a][1] += 1
            temp[b][1] += 1

        temp.sort(key = lambda x : -x[1])

        for imp in range(1, n+1) : 
            temp[imp-1][1] = (n-imp) + 1

        temp.sort(key = lambda x : x[0])
                
        for a, b in roads : 
            answer += (temp[a][1] + temp[b][1])

        return answer
        
