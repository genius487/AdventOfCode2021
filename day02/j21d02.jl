

file = readlines("21day02.txt")
parts = [0,0]

let forward = 0, depth = 0

	for line in file
		instruct = split(line, " ")

		if instruct[1] == "forward" forward += parse(Int64, instruct[2])
		elseif instruct[1] == "down" depth += parse(Int64, instruct[2])
		elseif instruct[1] == "up" depth -= parse(Int64, instruct[2])
		end

	end

parts[1] = forward*depth

end


## PART 2 ##

let forward = 0, depth = 0, aim = 0

	for line in file
		instruct = split(line, " ")

		if instruct[1] == "forward"
			forward += parse(Int64, instruct[2])
			depth += aim*parse(Int64, instruct[2]) 
		elseif instruct[1] == "down" aim += parse(Int64, instruct[2])
		elseif instruct[1] == "up" aim -= parse(Int64, instruct[2])
		end

	end

	parts[2] = forward*depth

end

println(parts)