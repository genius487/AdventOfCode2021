

depths = readlines("21day01.txt") |> d -> parse.(Int64, d)

parts = [0,0]

for ind in 2:length(depths)
	if depths[ind] > depths[ind-1]
		parts[1] += 1
	end
	if ind >= 4
		if depths[ind] > depths[ind-3]
			parts[2] += 1
		end
	end
end

println(parts)