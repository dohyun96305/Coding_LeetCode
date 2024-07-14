class Solution(object):
    def exist(self, board, word):
        """
        :type board: List[List[str]]
        :type word: str
        :rtype: bool
        """
        lx = len(board)
        ly = len(board[0])

        dx = [1, -1, 0, 0]
        dy = [0, 0, 1, -1]

        def dfs(x, y, idx):
            if idx == len(word):
                return True
            
            for i in range(4):
                nx = x + dx[i]
                ny = y + dy[i]

                if 0 <= nx < lx and 0 <= ny < ly and board[nx][ny] == word[idx]:
                    temp, board[nx][ny] = board[nx][ny], ''  
                    if dfs(nx, ny, idx + 1):
                        return True
                    board[nx][ny] = temp 

            return False

        for i in range(lx):
            for j in range(ly):
                if board[i][j] == word[0]:
                    temp, board[i][j] = board[i][j], '' 
                    if dfs(i, j, 1):
                        return True
                    board[i][j] = temp 
        
        return False
