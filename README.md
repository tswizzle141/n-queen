# n-queen
coding n-queen by julia

1. **`is_safe`**: 
   - check if placing a queen at `board[row] = col` is valid.
   - ensure no other queen is in the same column, upper-left diagonal, or upper-right diagonal.

2. **`solve_n_queens_recursive`**:
   - place queens one by one starting from the first row.
   - recursively try to solve for the next row after placing a queen.
   - use backtracking by resetting `board[row]` to 0 if placing the queen leads to no solution.

3. **`solve_n_queens`**:
   - initialize the board and calls the recursive solver.
   - collects all valid solutions in the `solutions` array.
