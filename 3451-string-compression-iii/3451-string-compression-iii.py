class Solution:
    def compressedString(self, word: str) -> str:
        word_temp = word[0]
        answer = ''
        count = 1

        for str_temp in word[1:] :
            if str_temp == word_temp : 
                if count < 9 : 
                    count += 1
                else : 
                    answer += str(count) + word_temp
                    count = 1
            else : 
                answer += str(count) + word_temp
                count = 1 
                word_temp = str_temp 

        answer += str(count) + word_temp

        return answer