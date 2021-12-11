# day 10 in Julia

# I wanted to use push! and pop!
input = [split(i, "") for i in readlines("input/day10/test_input.txt")]

flip_dict = Dict("(" => ")", "[" => "]", "{" => "}", "<" => ">")
# return the invalid thing or the end
function do_line(line)
    opens = String[]
    answer = String[]
    for i in line
        
        if i in ["(","[","{","<"]
            push!(opens, i) 
        else
            if flip_dict[opens[end]] == i
                pop!(opens)
            else 
                answer = i
                break
            end
        end 
    end
    if length(answer) > 0
        return answer
    else
        return opens
    end
end

function score(res)
    part1_scores = Dict(")"=>3, "]" =>57, "}"=>1197, ">"=>25137)
    if length(res) == 1
        part1_scores[res]
    else
        0
    end
end

# part 1 answer
sum([score(do_line(x)) for x in input])

# part 2 answer - need to update scoring function 