class Solution(object):
    def maximumImportance(self, n, roads):
        """
        :type n: int
        :type roads: List[List[int]]
        :rtype: int
        """
        answer = 0
        cities = [[x, 0] for x in range(n)]
        imp = [0] * n

        for a, b in roads : 
            cities[a][1] += 1
            cities[b][1] += 1

        cities.sort(key = lambda x : -x[1])

        count = n
        for a, b in cities : 
            imp[a] = n
            n -= 1
        
        for a, b in roads : 
            answer += (imp[a] + imp[b])

        return answer
        
