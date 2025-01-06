# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

class Solution:
    def isSymmetric(self, root: Optional[TreeNode]) -> bool:
        return self.check_symmetric(root, root)


    def check_symmetric(self, root1, root2) : 
        if root1 == None and root2 == None : # leaf symmetric
            return True

        elif root1 == None or root2 == None : # leaf symmetric
            return False
        
        return (
            (root1.val == root2.val) # check value symmetric
            and self.check_symmetric(root1.right, root2.left) 
            and self.check_symmetric(root1.left, root2.right)
        )
        

        