# DFS + Back_Tracking 
# Not Minimum value to collect, Maximum value to collect + BFS
# To consider all start way => Backtracking

class Solution(object):
    def getMaximumGold(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: int
        """
        lx = len(grid)
        ly = len(grid[0])

        dx = [1, -1, 0, 0]
        dy = [0, 0, 1, -1]

        def dfs(x, y, current, visited): # DFS Function
            next = current # To store current value 
            visited[x][y] = 1
                
            for i in range(4):
                nx = x + dx[i]
                ny = y + dy[i]
                
                if nx < 0 or nx >= lx or ny < 0 or ny >= ly : 
                    continue 
                     
                if grid[nx][ny] != 0 and visited[nx][ny] == 0:
                    next = max(next, dfs(nx, ny, current + grid[nx][ny], visited))
            
            visited[x][y] = 0
            return next

        max_value = 0
        visited = [[0] * ly for _ in range(lx)]

        for i in range(lx):
            for j in range(ly):
                if grid[i][j] != 0:
                    max_value = max(max_value, dfs(i, j, grid[i][j], visited))

        return max_value