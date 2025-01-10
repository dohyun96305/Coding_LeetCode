class Solution:
    def solve(self, board: List[List[str]]) -> None:
        """
        Do not return anything, modify board in-place instead.
        """
        lx = len(board)
        ly = len(board[0])

        dx = [-1, 1, 0, 0] # U, D, L, R
        dy = [0, 0, -1, 1] # U, D, L, R

        def dfs(x, y, board, str1, str2) :
            if 0 > x or x >= lx or 0 > y or y >= ly or board[x][y] != str1 : 
                return

            board[x][y] = str2

            for i in range(4) : 
                nx = x + dx[i]
                ny = y + dy[i]

                dfs(nx, ny, board, str1, str2)
                    
        for i in range(lx) : 
            if board[i][0] == 'O' : 
                dfs(i, 0, board, 'O', 'B')
            if board[i][ly - 1] == 'O' : 
                dfs(i, ly-1, board, 'O', 'B')

        for i in range(ly) : 
            if board[0][i] == 'O' : 
                dfs(0, i, board, 'O', 'B')
            if board[lx - 1][i] == 'O' : 
                dfs(lx - 1, i, board, 'O', 'B')

        for i in range(lx) : 
            for j in range(ly) : 
                if board[i][j] == 'B' : 
                    board[i][j] = 'O'

                elif board[i][j] == 'O' : 
                    board[i][j] = 'X'
