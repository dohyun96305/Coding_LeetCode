class Solution(object):
    def minRemoveToMakeValid(self, s):
        """
        :type s: str
        :rtype: str
        """
        len_s = len(s)
        temp = []
        remove_list = [0] * len_s
        answer = ''

        for i in range(len_s) : 
            if s[i].islower() : 
                continue
            
            if s[i] == '(' : 
                temp.append(i)

            else : 
                if temp : 
                    temp.pop()
                else : 
                    remove_list[i] = 1

        for i in temp : 
            remove_list[i] = 1

        for i in range(len_s) : 
            if remove_list[i] != 1 : 
                answer += s[i]

        return answer
