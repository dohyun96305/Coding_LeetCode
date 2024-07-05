import heapq

class Solution(object):
    def cutOffTree(self, forest):
        """
        :type forest: List[List[int]]
        :rtype: int
        """
        dx = [-1, 1, 0, 0]
        dy = [0, 0, -1, 1]

        lx = len(forest)
        ly = len(forest[0])

        temp = []
        for i in range(lx) : 
            for j in range(ly) : 
                if forest[i][j] != 0 and forest[i][j] > 1 : 
                    heapq.heappush(temp, (forest[i][j], i, j))

        def bfs(x, y, forest, wx, wy) : 
            visited = [[-1] * ly for _ in range(lx)]
            visited[x][y] = 0

            temp = deque()
            temp.append([x, y])

            while temp : 
                rx, ry = temp.popleft()

                if rx == wx and ry == wy : 
                    return visited[rx][ry]

                for i in range(4) : 
                    nx = rx + dx[i]
                    ny = ry + dy[i] 

                    if nx < 0 or nx >= lx or ny < 0 or ny >= ly : 
                        continue

                    if forest[nx][ny] != 0 and visited[nx][ny] == -1 : 
                        visited[nx][ny] = visited[rx][ry] + 1
                        temp.append([nx, ny])

            return -1

        kx = ky = answer = 0

        while temp : 
            height, wx, wy = heapq.heappop(temp)
            dist = bfs(kx, ky, forest, wx, wy)

            if dist == -1 : 
                return -1

            else : 
                answer += dist

            kx, ky = wx, wy

        return answer
