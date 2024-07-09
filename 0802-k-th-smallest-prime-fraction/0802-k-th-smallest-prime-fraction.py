# K-th Smallest Prime Fraction
# https://leetcode.com/problems/k-th-smallest-prime-fraction/description
# Given a sorted array arr of unique integers containing 1 and prime numbers, return the k-th smallest fraction arr[i] / arr[j] (0 <= i < j < arr.length) as an array [arr[i], arr[j]].

# heap

from heapq import heappush, heappop

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
            heappush(heap, (float(arr[i]) / float(arr[-1]), i, n-1))
        
        for i in range(k-1):
            _, l, r = heappop(heap)
            heappush(heap, (float(arr[l]) / float(arr[r-1]), l, r-1))

        _,l,r = heappop(heap)

        return [arr[l],arr[r]]
        