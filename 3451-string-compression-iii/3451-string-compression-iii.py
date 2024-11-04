class Solution:
    def compressedString(self, word: str) -> str:
        word_temp = deque(word)
        answer = ''

        while word_temp :
            count = 1
            str_temp = word_temp.popleft()

            while word_temp and str_temp == word_temp[0] and count < 9 : 
                count += 1
                word_temp.popleft()
            
            answer += str(count) + str_temp

        return answer