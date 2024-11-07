# If number of bits are same, then can be sorted
# Need to check max, min number of previous bit group and current bit group

# If number of bits are different and previous max > current min then can't be sorted

class Solution:
    def canSortArray(self, nums: List[int]) -> bool :
        pre_max = cur_min = cur_max = 0
        pre_cnt = -1

        for i in nums : 
            cur_cnt = i.bit_count()

            # Bit_Count group changing
            if pre_cnt != cur_cnt : 
                if cur_min < pre_max : 
                    return False
            
                pre_max = cur_max
                cur_min, cur_max = i, i
                pre_cnt = cur_cnt
            
            # Bit_Count group not changing
            else : 
                cur_min = min(cur_min, i)
                cur_max = max(cur_max, i)
            
        return cur_min >= pre_max