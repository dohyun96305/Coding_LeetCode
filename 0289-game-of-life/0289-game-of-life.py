class Solution:
    def gameOfLife(self, board: List[List[int]]) -> None:
        """
        Do not return anything, modify board in-place instead.
        """
        m, n = len(board), len(board[0])
        original_board = [[board[i][j] for j in range(n)] for i in range(m)]

        def check_neighbor(x, y, board) : 
            direc = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
            temp = 0

            for dx, dy in direc : 
                nx = x + dx
                ny = y + dy

                if nx >= 0 and nx < m and ny >= 0 and ny < n and board[nx][ny] == 1 :
                    temp += 1

            return temp

        for i in range(m) : 
            for j in range(n) : 
                live_cnt = check_neighbor(i, j, original_board) 

                if board[i][j] == 0 : 
                    if live_cnt == 3 : 
                        board[i][j] = 1 

                else : 
                    if live_cnt < 2 or live_cnt > 3 : 
                        board[i][j] = 0

# live cell with fewer than 2 live cell 'die'
# live cell with 2, 3 live cell 'live'
# live cell with more than 3 live cell 'die'

# die cell with 3 live cell 'live'