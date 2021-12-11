file = readlines("21day09.txt")

parts = [0,1]
heights = [[0 for j in 1:length(file[1])] for i in 1:length(file)]
largestBasins = [0,0,0]

function findAdjacents(point, iMax, jMax)
  i = point[1]
  j = point[2]
  adjacentsRef = []

  if i != iMax push!(adjacentsRef, [i+1,j]) end
  if i != 1 push!(adjacentsRef, [i-1,j]) end
  if j != jMax push!(adjacentsRef, [i,j+1]) end
  if j != 1 push!(adjacentsRef, [i,j-1]) end

  return adjacentsRef
end


for (i, line) in enumerate(file)
  for (j, l) in enumerate(line)
    heights[i][j] = parse(Int, l)
  end
end

for (i, line) in enumerate(heights)
  for (j, l) in enumerate(line)
    if l < 9

      ## Part 1 ##

      position = [i,j]
      adjacents = []
      
      for point in findAdjacents(position, length(heights), length(heights[1]))
        push!(adjacents, heights[point[1]][point[2]])
      end

      if l < minimum(adjacents)
        parts[1] += 1 + l

        ## PART 2 ##

        basin = [position]
        potentialLowsInBasin = findAdjacents(position, length(heights), length(heights[1]))

        while potentialLowsInBasin != []
          newPotentialLowsInBasin = []

          for level in potentialLowsInBasin
            if heights[level[1]][level[2]] < 9 && level ∉ basin
              push!(basin, level)
              for point in findAdjacents(level, length(heights), length(heights[1]))
                push!(newPotentialLowsInBasin, point)
              end
            end
          end

          potentialLowsInBasin = deepcopy(newPotentialLowsInBasin)
        end

        if length(basin) >= largestBasins[1]
          largestBasins[3] = largestBasins[2]
          largestBasins[2] = largestBasins[1]
          largestBasins[1] = length(basin)
        elseif length(basin) >= largestBasins[2]
          largestBasins[3] = largestBasins[2]
          largestBasins[2] = length(basin)
        elseif length(basin) >= largestBasins[2]
          largestBasins[3] = length(basin)
        end

      end
    end
  end
end

for l in largestBasins
  parts[2] *= l
end

println(parts)
println(largestBasins)
