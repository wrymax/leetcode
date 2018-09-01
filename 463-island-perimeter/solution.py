class Solution:
    def islandPerimeter(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: int
        """
        # BFS + count perimeter with number of 1 around each 1
        if len(grid) == 0:
            return 0
        rows = len(grid)
        cols = len(grid[0])
        
        perimeter = 0

        for r in range(rows):
            for c in range(cols):
                if grid[r][c] == 1:
                    temp_p = 4
                    for i in [(r, c+1), (r, c-1), (r+1, c), (r-1, c)]:                       
                        if i[0] >= 0 and i[0] < rows and i[1] >= 0 and i[1] < cols and grid[i[0]][i[1]] == 1:
                            temp_p -= 1
                    perimeter += temp_p
                    
        return perimeter

s = Solution()
grid = [[1,1],[1,1]]
print(s.islandPerimeter(grid))
