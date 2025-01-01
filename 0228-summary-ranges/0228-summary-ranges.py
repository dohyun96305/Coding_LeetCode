class Solution:
    def summaryRanges(self, nums: List[int]) -> List[str]:
        if not nums : 
            return []

        if len(nums) == 1 : 
            return [str(nums[0])]
        
        temp = [nums[0]]
        answer = []

        for i in range(1, len(nums)) : 
            if nums[i] == (temp[-1] + 1) : 
                temp.append(nums[i])
            
            else : 
                if len(temp) == 1 : 
                    answer.append(str(temp[0]))

                else : 
                    answer.append(f'{temp[0]}->{temp[-1]}')
                
                temp = [nums[i]]

        if len(temp) == 1 : 
            answer.append(str(temp[0]))

        else : 
            answer.append(f'{temp[0]}->{temp[-1]}')


        return answer
