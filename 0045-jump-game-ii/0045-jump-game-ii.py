class Solution:
    def jump(self, nums: List[int]) -> int:
        answer = 0
        n = len(nums)
        cur_end, cur_far = 0, 0

        for i in range(n - 1) :
            cur_far = max(cur_far, i + nums[i])

            if i == cur_end : 
                answer += 1 
                cur_end = cur_far 

            print(cur_end, cur_far, answer)

        return answer
