class Solution(object):
    def relativeSortArray(self, arr1, arr2):
        """
        :type arr1: List[int]
        :type arr2: List[int]
        :rtype: List[int]
        """

        count_num = [0] * 1001
        answer = []
        
        for a in arr1 : 
            count_num[a] += 1 

        for b in arr2 : 
            for _ in range(count_num[b]) : 
                answer.append(b)
            count_num[b] = 0

        for a in range(1001) :
            if count_num[a] > 0 :
                for _ in range(count_num[a]) : 
                    answer.append(a)
                count_num[a] = 0

        return answer
        