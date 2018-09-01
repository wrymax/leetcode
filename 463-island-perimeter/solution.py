class Solution:
    def islandPerimeter(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: int
        """
        perimeter = 0

        for r, row in enumerate(grid):
            for c, value in enumerate(row):
                if value:
                    perimeter += 4
                    if r > 0 and grid[r-1][c] == 1: perimeter -= 2
                    if c > 0 and grid[r][c-1] == 1: perimeter -= 2
                    
        return perimeter
