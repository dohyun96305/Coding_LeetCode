class Solution(object):
    def minRemoveToMakeValid(self, s):
        """
        :type s: str
        :rtype: str
        """
        len_s = len(s)
        s_list = list(s)
        temp = []

        for i in range(len_s) : 
            if s[i] == '(' : 
                temp.append(i)

            elif s[i] == ')' : 
                if temp : 
                    temp.pop()
                else : 
                    s_list[i] = ''
            
            else : 
                continue

        while temp : 
            s_list[temp.pop()] = ''

        return ''.join(s_list)
