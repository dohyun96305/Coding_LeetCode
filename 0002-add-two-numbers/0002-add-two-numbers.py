# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        temp = temp_head = ListNode(0)
        temp_num = 0

        while l1.next or l2.next :
            if l1.next == None : 
                l1.next = ListNode(0)
            if l2.next == None : 
                l2.next  = ListNode(0)

            temp_val = (l1.val + l2.val) 
            temp.next = ListNode((temp_val + temp_num) % 10)
            temp_num = (temp_val + temp_num) // 10 

            l1 = l1.next
            l2 = l2.next
            temp = temp.next
        
        temp_val = l1.val + l2.val + temp_num
        if temp_val >= 10 : 
            temp.next = ListNode(temp_val % 10)
            temp.next.next = ListNode(temp_val // 10 )
        else : 
            temp.next = ListNode(temp_val % 10)

        

        return temp_head.next 