#number guessing game 

#=
wait the bug 1 happens only when i click the run icon, but if i click ctrl+enter i get another error, 
and when i manually click the run without debugging it works as intended 
=#

using Random

function Game()
    print("enter your guess: ")
    ans = rand(1:100)
    max_iter = 7
    user_guess = 0
    for i in 1:max_iter
        user_guess = readline()
        user_guess = parse(Int, user_guess)
        if user_guess == ans
            println("correct! you win.")
            return
        elseif i == max_iter
            println("you lose!")
            break
        elseif user_guess > ans
            println("try smaller number")
        else
            println("try larger number")
        end

        println("guess remaining - $(max_iter-i)")

        println("next_guess: ")

    end

    if user_guess != ans # how do i get the user_guess out here
        println("answer was: $ans")
    end
end

Game()

