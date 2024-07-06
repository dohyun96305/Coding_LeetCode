class Solution(object):
    def maximumImportance(self, n, roads):
        """
        :type n: int
        :type roads: List[List[int]]
        :rtype: int
        """
        answer = 0
        cities = [0] * n
        imp = [x for x in range(n)]
        values = [0] * n

        for a, b in roads : 
            cities[a] += 1
            cities[b] += 1

        imp.sort(key = lambda x : -cities[x])
        
        
        for a in imp : 
            values[a] = n
            n -= 1

        for a, b in roads : 
            answer += (values[a] + values[b])

        return answer
        
