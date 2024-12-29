class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        def check_sq(row, board) : 
            temp = []

            for i in row : 
                if i != '.' : 
                    if i in temp :
                        return False

                    temp.append(i)
                
            return True
            
        for i in range(9) : 
            if not check_sq(board[i], board) : 
                return False

        for i in range(9) : 
            row = [board[j][i] for j in range(9)]
            if not check_sq(row, board) : 
                return False

        for i in range(0, 9, 3) : 
            for j in range(0, 9, 3) : 
                row = [board[a][b] for a in range(i, i+3) for b in range(j, j+3)]
                if not check_sq(row, board) : 
                    return False

        return True