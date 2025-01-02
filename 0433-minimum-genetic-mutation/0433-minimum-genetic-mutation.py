class Solution:
    def minMutation(self, startGene: str, endGene: str, bank: List[str]) -> int:
        def check_gene(a, b) :
            cnt = 0

            for i, j in zip(a, b) : 
                if i != j : 
                    cnt += 1

            return cnt

        if endGene not in bank : 
            return -1

        visited = set()
        temp = deque([(startGene, 0)])

        while temp : 
            gene, cnt = temp.popleft()
            visited.add(gene)

            if gene == endGene : 
                return cnt

            for i in bank : 
                if check_gene(gene, i) == 1 and i not in visited : 
                    temp.append((i, cnt + 1))
                    visited.add(i)
        
        return -1