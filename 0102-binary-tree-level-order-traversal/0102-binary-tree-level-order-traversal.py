# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        temp = []

        if not root : 
            return temp

        def check_level(head, levels) : 
            if levels > len(temp) - 1 : 
                temp.append([])

            temp[levels].append(head.val)

            if head.left : 
                check_level(head.left, levels + 1)
            if head.right : 
                check_level(head.right, levels + 1)

        check_level(root, 0)
        
        return temp