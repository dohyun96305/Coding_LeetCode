class Solution:
    def candy(self, ratings: List[int]) -> int:
        candies = [1] * len(ratings)

        for i in range(1, len(ratings)) : 
            if ratings[i-1] < ratings[i] : 
                candies[i] = candies[i-1] + 1 
        
        for i in range(len(ratings) - 2, -1, -1) : 
            if ratings[i] > ratings[i+1] : 
                candies[i] = max(candies[i+1] + 1, candies[i])

        

        return sum(candies)

# each child must have at least one candy
# child with higher ratings get more candy than neighbors