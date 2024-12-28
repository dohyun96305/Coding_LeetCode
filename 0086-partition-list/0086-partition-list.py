# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:
    def partition(self, head: Optional[ListNode], x: int) -> Optional[ListNode]:
        left = left_head = ListNode(0)
        right = right_head =  ListNode(0)

        while head : 
            if head.val >= x : 
                right.next = head 
                right = right.next

            else : 
                left.next = head
                left = left.next

            head = head.next

        right.next = None
        left.next = right_head.next

        return left_head.next