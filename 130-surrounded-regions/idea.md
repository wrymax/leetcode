Question:

Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.

A region is captured by flipping all 'O's into 'X's in that surrounded region.

For example,
```
X X X X
X O O X
X X O X
X O X X
```
After running your function, the board should be:
```
X X X X
X X X X
X X X X
X O X X
```
---
Ideas:

#### Variables:
1. visited matrix for marking the visited places
2. current O matrix for marking the current O region indices
3. current region status:
	* 0 for failed
	* 1 for successful(default)


#### Algorithm:
1. Traverse the matrix
	* Mark the element as visited
	* Continue if it is a:
		* already visited O
		* X
	* if it meets an unvisited 'O', then start doing BFS:
		* if an O exceeds the boundary, then mark current_region_status = 0
		* if the BFS ends up with current_region_status == 1, then update this region into 'X'
		* when the BFS ends, update current_region_status back to 1
