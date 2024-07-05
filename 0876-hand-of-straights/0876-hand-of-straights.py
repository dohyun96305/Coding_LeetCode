from collections import Counter
from collections import deque

class Solution(object):
    def isNStraightHand(self, hand, groupSize):
        """
        :type hand: List[int]
        :type groupSize: int
        :rtype: bool
        """ 
        if len(hand) % groupSize != 0 : 
            return False

        hand = sorted(hand)

        while hand : 
            len_first = len(hand)
            k = hand[0]
            temp = []
            
            for i in range(groupSize) : 
                if k + i in hand : 
                    temp.append(k+i)
                else : 
                    return False
            
            if len(temp) == groupSize : 
                for a in temp : 
                    hand.remove(a)
            else : 
                return False

            if not hand : 
                return True

            if len_first == len(hand) : 
                return False