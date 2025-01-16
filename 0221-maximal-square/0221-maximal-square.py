class Solution:
    def maximalSquare(self, matrix: List[List[str]]) -> int:
        m = len(matrix)
        n = len(matrix[0]) 

        if matrix is None : 
            return 0

        dp = [[0] * (n+1) for _ in range(m + 1)]
        temp = 0

        for i in range(m) : 
            for j in range(n) : 
                if matrix[i][j] == '1' : 
                    dp[i+1][j+1] = min(dp[i][j], dp[i+1][j], dp[i][j+1]) + 1
                    temp = max(temp, dp[i+1][j+1])    

        return temp * temp         


                            

                                                 