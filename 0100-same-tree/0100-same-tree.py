# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

class Solution:
    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:

        def tree_check(p, q) : 
            if not p and not q : 
                return True
            
            if not q or not p : 
                return False

            if p.val != q.val : 
                return False

            return True

        temp = deque([(p, q)])

        while temp : 
            left, right = temp.popleft()

            if not tree_check(left, right) : 
                return False

            if left and right : 
                temp.append((left.left, right.left))
                temp.append((left.right, right.right))

        return True
                
            

        