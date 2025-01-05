class RandomizedSet:

    def __init__(self):
        self.temp = []
        self.temp_map = {}
        

    def insert(self, val: int) -> bool:
        if val in self.temp : 
            return False

        self.temp.append(val)
        self.temp_map[val] = len(self.temp) - 1 

        return True
        
    def remove(self, val: int) -> bool:
        if val not in self.temp : 
            return False
        
        last_val = self.temp[-1]
        idx_val = self.temp_map[val] 

        self.temp[idx_val] = last_val
        self.temp_map[last_val] = idx_val

        self.temp.pop()
        del self.temp_map[val]

        return True 

    def getRandom(self) -> int:
        return random.choice(self.temp)
            
        


# Your RandomizedSet object will be instantiated and called as such:
# obj = RandomizedSet()
# param_1 = obj.insert(val)
# param_2 = obj.remove(val)
# param_3 = obj.getRandom()