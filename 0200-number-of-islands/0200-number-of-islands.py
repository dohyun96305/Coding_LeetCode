class Solution(object):
    def numIslands(self, grid):
        """
        :type grid: List[List[str]]
        :rtype: int
        """
        
        dx = [-1, 1, 0, 0]
        dy = [0, 0, -1, 1]

        lx, ly = len(grid), len(grid[0])

        def bfs(x, y, grid) : 

            q = deque()
            q.append([x, y])

            while q : 
                x, y = q.popleft()

                for i in range(4) : 
                    nx = x + dx[i]
                    ny = y + dy[i]

                    if nx < 0 or nx >= lx or ny < 0 or ny >= ly : 
                        continue

                    if grid[nx][ny] == '1' : 
                        grid[nx][ny] = '0'
                        q.append([nx, ny])

            return grid

        answer = 0

        for i in range(lx) : 
            for j in range(ly) : 
                if grid[i][j] == '1' : 
                    answer += 1
                    grid = bfs(i, j, grid)

        return answer