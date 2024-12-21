class Solution:
    def finalValueAfterOperations(self, operations: List[str]) -> int:
        return len([x for x in operations if '+' in x]) - len([x for x in operations if '-' in x])