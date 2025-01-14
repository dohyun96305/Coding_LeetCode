class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        if not strs : 
            return None

        n = len(strs[0])

        for i in range(n) : 
            temp = strs[0][i]
            
            for j in range(1, len(strs)) : 
                if i == len(strs[j]) or strs[j][i] != temp : 
                    return strs[0][:i]

        return strs[0]
        