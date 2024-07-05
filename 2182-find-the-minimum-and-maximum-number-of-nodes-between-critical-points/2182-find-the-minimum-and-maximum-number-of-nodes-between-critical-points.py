# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution(object):
    def nodesBetweenCriticalPoints(self, head):
        """
        :type head: Optional[ListNode]
        :rtype: List[int]
        """
        temp = []

        k, head = head.val, head.next
        count = 2
        
        if not head.next : 
            return [-1, -1]

        else : 
            while head.next : 
                if (head.val > k and head.val > head.next.val) or (head.val < k and head.val < head.next.val) : 
                    temp.append(count)
                k, head = head.val, head.next

                count += 1

        if not temp or len(temp) == 1 : 
            return [-1, -1]

        max_len = temp[-1] - temp[0]
        min_len = max_len

        for a, b in zip(temp[:-1], temp[1:]) : 
            min_len = min(min_len, b-a)

        return [min_len, max_len]



