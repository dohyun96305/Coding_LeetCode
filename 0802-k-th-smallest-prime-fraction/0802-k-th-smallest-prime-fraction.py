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
            res = float(arr[i])/float(arr[-1])
            heappush(heap,(res,i,n-1))
        
        for i in range(k-1):
            res,l,r = heappop(heap)
            res = float(arr[l])/float(arr[r-1])
            heappush(heap,(res,l,r-1))

        res,l,r = heappop(heap)

        return [arr[l],arr[r]]
        