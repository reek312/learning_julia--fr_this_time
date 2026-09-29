
const ROW = 20
const COL = 30
const init_prob = 0.2

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
        if i.alive && i.location in to_check
            total_alive+=1
        end
    end
    total_alive
end

function step!(agent_list)
    is_alive = Bool[]
    for agent in agent_list
        neighbors = alive_neighbor(agent, agent_list)
        will_live = (neighbors == 3) || (agent.alive && neighbors == 2)
        push!(is_alive, will_live)
    end
    for i = 1:ROW*COL
        agent_list[i].alive = is_alive[i]
    end
end

function display_grid(agent_list)
    grid = fill('.', ROW, COL)
    
    for agent in agent_list
        if agent.alive
            x, y = agent.location
            grid[x, y] = '#'
        end
    end

    print("\033[H\033[J")

    for row in 1:ROW
        println(join(grid[row, :], " "))
    end
end


function game()
    agent_list = Agent[]
    generations = 100
    for i = 1:ROW, j = 1:COL
        likely_alive = rand()<init_prob
        agent = Agent(likely_alive, (i,j))
        push!(agent_list, agent)
    end
    for i = 1:generations
        step!(agent_list)
        display_grid(agent_list)
        sleep(0.3)
    end
end


game()
