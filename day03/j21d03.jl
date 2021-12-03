file = readlines("21day03.txt")
parts = [0,0]

binCount = zeros(length(file[1]))
binGamma = []
binEpsilon = []

for line in file
	for (i, b) in enumerate(line)
		if b == '1' binCount[i] += 1
		else binCount[i] -= 1
		end
	end
end


for b in binCount
	if b > 0
		push!(binGamma, '1')
		push!(binEpsilon, '0')
	else
		push!(binGamma, '0')
		push!(binEpsilon, '1')
	end
end

parts[1] = parse(Int, join(binGamma), base=2)*parse(Int, join(binEpsilon), base=2)


## PART 2 ##

let oxysearch = file, co2search = file, ind = 1

	while length(oxysearch) > 1
		num1s = []
		num0s = []

		for line in oxysearch
			if line[ind] == '1' push!(num1s,line)
			else push!(num0s,line)
			end
		end

		if length(num1s) >= length(num0s) oxysearch = num1s
		else oxysearch = num0s
		end

		ind += 1
	end

	ind = 1

	while length(co2search) > 1
		num1s = []
		num0s = []

		for line in co2search
			if line[ind] == '1' push!(num1s,line)
			else push!(num0s,line)
			end
		end

		if length(num0s) <= length(num1s) co2search = num0s
		else co2search = num1s
		end

		ind += 1
	end

	parts[2] = parse(Int, oxysearch[1], base=2)*parse(Int, co2search[1], base=2)

end

println(parts)
