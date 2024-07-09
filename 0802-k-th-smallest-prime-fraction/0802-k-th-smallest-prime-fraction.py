class Solution(object):
    def kthSmallestPrimeFraction(self, arr, k):
        """
        :type arr: List[int]
        :type k: int
        :rtype: List[int]
        """
        heap = []
        n = len(arr)

        for i in range(n-1):
            heappush(heap,(float(arr[i])/float(arr[-1]),i,n-1))
        
        for i in range(k-1):
            res,l,r = heappop(heap)
            heappush(heap,(float(arr[l])/float(arr[r-1]),l,r-1))

        res,l,r = heappop(heap)

        return [arr[l],arr[r]]
        