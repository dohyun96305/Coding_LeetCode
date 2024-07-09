class Solution(object):
    def wordBreak(self, s, wordDict):
        """
        :type s: str
        :type wordDict: List[str]
        :rtype: List[str]
        """
        answer = []
        wordDict = set(wordDict)

        def backtrack(i, start, current) : 
            if i == len(s) : 
                if len(''.join(current)) == len(s) : 
                    answer.append(' '.join(current))

                return

            backtrack(i+1, start, current)

            if s[start:i+1] in wordDict : 
                current.append(s[start : i+1])
                backtrack(i+1, i+1, current)
                current.pop()

        backtrack(0, 0, [])

        return answer        