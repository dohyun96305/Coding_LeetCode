class Solution(object):
    def findCenter(self, edges):
        """
        :type edges: List[List[int]]
        :rtype: int
        """
        a,b = edges[0]

        for k1, k2 in edges[1:] : 
            if k1 == a or k2 == a : 
                return a
            else : 
                return b