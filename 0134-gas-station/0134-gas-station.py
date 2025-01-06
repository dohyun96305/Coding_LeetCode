class Solution:
    def canCompleteCircuit(self, gas: List[int], cost: List[int]) -> int:
        n = len(gas) 

        total_gas = 0
        current_gas = 0
        answer = 0 

        for i in range(n) : 
            total_gas += gas[i] - cost[i]
            current_gas += gas[i] - cost[i]

            if current_gas < 0 : 
                current_gas = 0 
                answer = i + 1
        
        return answer if total_gas >= 0 else -1

