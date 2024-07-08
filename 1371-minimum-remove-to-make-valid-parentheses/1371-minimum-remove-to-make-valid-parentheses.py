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
            if s[i] == '(' : 
                temp.append(i)

            elif s[i] == ')' : 
                if temp : 
                    temp.pop()
                else : 
                    remove_list[i] = 1
            
            else : 
                continue

        while temp : 
            remove_list[temp.pop()] = 1

        for i in range(len_s) : 
            if remove_list[i] != 1 : 
                answer += s[i]

        return answer
