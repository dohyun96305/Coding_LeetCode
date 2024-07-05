class Solution(object):
    def addSpaces(self, s, spaces):
        """
        :type s: str
        :type spaces: List[int]
        :rtype: str
        """
        answer = []
        temp = 0
        
        for idx in spaces : 
            answer.append(s[temp:idx])
            temp = idx

        answer += [s[temp:]]
        return ' '.join(answer)

        