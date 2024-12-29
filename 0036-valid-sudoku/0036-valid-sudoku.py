class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        def check_sq(a, b, board) : 
            temp = {}

            for i in range(a, a+3) :
                for j in range(b, b+3) : 
                    if board[i][j] != '.' : 
                        if board[i][j] in temp.keys() : 
                            return False

                        else :
                            temp[board[i][j]] = 1 
                
            return True
            
        for i in range(9) : 
            temp = {}
            for j in board[i] : 
                if j != '.' : 
                    if j in temp.keys() : 
                        return False
                    else :
                        temp[j] = 1 
        
        for i in range(9) : 
            temp = {}
            for j in range(9) : 
                if board[j][i] != '.' : 
                    if board[j][i] in temp.keys() : 
                        return False

                    else :
                        temp[board[j][i]] = 1 

        for i in range(9) : 
            for j in range(9) : 
                if i in (0, 3, 6) and j in (0, 3, 6) : 
                    if not check_sq(i, j, board) : 
                        return False

        return True