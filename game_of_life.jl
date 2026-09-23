using Random

mutable struct Agent
    alive::Bool
    location::Tuple{Int, Int}
end

function alive_neighbor(agent::Agent, agent_list)
    total_alive = 0
    x, y = agent.location[1], agent.location[2]
    to_check = [(x+1, y), (x-1, y), (x, y+1), (x, y-1),
                (x+1, y+1), (x-1, y+1), (x+1, y-1), (x-1, y-1)]
    for i in agent_list
        if i.location in to_check && i.alive
            total_alive+=1
        end
    end
    total_alive
end

function step(agent_list)
    for agent in agent_list
        neighbors = alive_neighbor(agent, agent_list)
        if neighbors>3 || neighbors<2
            agent.alive = false
        else
            agent.alive = true
        end
    end
end

function display_grid(agent_list, grid_size=20)
    # Initialize a 2D array filled with dots (dead)
    grid = fill('.', grid_size, grid_size)
    
    for agent in agent_list
        if agent.alive
            x, y = agent.location
            grid[x, y] = '#'  # Represent alive cells
        end
    end

    # Print the frame
    print("\033[H\033[2J") # Clear terminal screen
    for row in 1:grid_size
        println(join(grid[row, :], " "))
    end
    println()
end


function game()
    agent_list = []
    for i = 1:20, j = 1:20
        likely_alive = rand()<0.3
        agent = Agent(likely_alive, (i,j))
        push!(agent_list, agent)
    end
    for i = 1:50
        step(agent_list)
        display_grid(agent_list, 20)
        sleep(0.1)
    end
end


game()


#  learn @views and things like that