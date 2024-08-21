class Solution(object):
    def firstMissingPositive(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        
        hash = {}
        temp = 0

        for i in nums : 
            if i in hash or i <= 0:
                pass
            else : 
                hash[i] = 1

        hash = sorted(hash.items(), key = lambda x : x[0] )
        for key, value in hash :
            print(temp, key) 
            
            if key == temp + 1 : 
                temp = key
            else : 
                break

        return temp + 1
                
      