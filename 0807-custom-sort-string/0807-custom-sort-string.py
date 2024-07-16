class Solution(object):
    def customSortString(self, order, s):
        """
        :type order: str
        :type s: str
        :rtype: str
        """
        order_dict = {x : 0 for x in order}
        temp = []
        answer = []

        for i in s : 
            if i in order_dict.keys() : 
                order_dict[i] += 1
            else : 
                temp.append(i)

        for i in order : 
            answer.append(i * order_dict[i])

        return ''.join(answer + temp)