class Solution:
    def sameEndSubstringCount(self, s: str, queries: List[List[int]]) -> List[int]:
        counter = [] 
        temp_counter = [0] * 26
        counter.append(temp_counter.copy())

        for temp_str in s:
            temp_counter[ord(temp_str) - ord('a')] += 1
            counter.append(temp_counter.copy())
        
        answer = []

        for left, right in queries:
            cur = 0

            for i in range(26):
                temp = counter[right + 1][i] - counter[left][i]
                cur += temp * (temp - 1) // 2

            answer.append(cur + (right - left + 1))
        
        return answer