class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        m, n = len(matrix), len(matrix[0])
        visited = [[False] * n for _ in range(m)]
        answer = []

        dx = [0, 1, 0, -1]
        dy = [1, 0, -1, 0]

        nx, ny = 0, 0
        k = 0

        for i in range(m * n) : 
            answer.append(matrix[nx][ny])
            visited[nx][ny] = True

            temp_x = nx + dx[k % 4]
            temp_y = ny + dy[k % 4]

            if temp_x >= m or temp_y >= n : 
                k += 1

            else : 
                if visited[temp_x][temp_y] : 
                    k += 1 

            nx += dx[k % 4]
            ny += dy[k % 4]

        return (answer)