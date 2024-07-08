class Solution(object):
    def minRemoveToMakeValid(self, s):
        """
        :type s: str
        :rtype: str
        """
        len_s = len(s)
        temp_list1 = []
        temp_list2 = []

        for i in range(len_s) : 
            if s[i].islower() : 
                continue
            
            if s[i] == '(' : 
                temp_list1.append(i)

            else : 
                if temp_list1 : 
                    temp_list1.pop()
                else : 
                    temp_list2.append(i)

        remove_list = sorted(temp_list1 + temp_list2)
        answer = ''

        for i in range(len_s) : 
            if i not in remove_list : 
                answer += s[i]

        return answer
