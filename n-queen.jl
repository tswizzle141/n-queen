function is_safe(board, row, col, n)
    #check the same column
    for i in 1:row-1
        if board[i] == col
            return false
        end
    end

    #check the upper-left diagonal
    for i in 1:row-1
        if board[i] == col-(row-i)
            return false
        end
    end

    #check the upper-right diagonal
    for i in 1:row-1
        if board[i] == col+(row-i)
            return false
        end
    end

    return true
end

function solve_n_queens_recursive(board, row, n, solutions)
    if row > n
        #valid configuration is found, add to solutions
        push!(solutions, copy(board))
        return
    end

    for col in 1:n
        if is_safe(board, row, col, n)
            board[row] = col
            solve_n_queens_recursive(board, row+1, n, solutions)
            board[row] = 0  #backtrack
        end
    end
end

function solve_n_queens(n)
    board = zeros(Int, n)  #array to store queen positions
    solutions = []
    solve_n_queens_recursive(board, 1, n, solutions)
    return solutions
end

function print_solutions(solutions, n)
    for solution in solutions
        println("Solution:")
        for i in 1:n
            row = ["." for _ in 1:n]
            row[solution[i]] = "Q"
            println(join(row, " "))
        end
        println()
    end
end

#ex
n = 4  #change n
solutions = solve_n_queens(n)
println("Number of solutions: ", length(solutions))
print_solutions(solutions, n)
