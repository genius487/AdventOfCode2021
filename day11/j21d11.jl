file = readlines("21day11.txt")

parts = [0,0]
octopuses = [[0 for j in 1:length(file[1])] for i in 1:length(file)]
steps = 0
isSimultaneousFlash = false

function findAdjacents(point, iMax, jMax)
  i = point[1]
  j = point[2]
  adjacentsRef = []

  if i != iMax
    push!(adjacentsRef, [i+1,j])
    if j != jMax push!(adjacentsRef, [i+1,j+1]) end
    if j != 1 push!(adjacentsRef, [i+1,j-1]) end
  end
  if i != 1 
    push!(adjacentsRef, [i-1,j])
    if j != jMax push!(adjacentsRef, [i-1,j+1]) end
    if j != 1 push!(adjacentsRef, [i-1,j-1]) end
  end

  if j != jMax push!(adjacentsRef, [i,j+1]) end
  if j != 1 push!(adjacentsRef, [i,j-1]) end

  return adjacentsRef
end


for (i, line) in enumerate(file)
  for (j, l) in enumerate(line)
    octopuses[i][j] = parse(Int, l)
  end
end

while !isSimultaneousFlash
  global steps += 1
  flashedOctopuses = []

  for i in 1:length(octopuses)
    for j in 1:length(octopuses[1])    
      octopuses[i][j] += 1
      potentialFlash = [[i,j]]

      while potentialFlash != []
        newPotentialFlash = []

        for octo in potentialFlash
          if octopuses[octo[1]][octo[2]] > 9 && octo ∉ flashedOctopuses
            if steps <= 100 parts[1] += 1 end #Num of Flashes
            push!(flashedOctopuses, octo)

            for neighbour in findAdjacents(octo, length(octopuses), length(octopuses[1]))
              octopuses[neighbour[1]][neighbour[2]] += 1
              push!(newPotentialFlash, neighbour)
            end
          end
        end

        potentialFlash = deepcopy(newPotentialFlash)
      end
    end
  end

  for octo in flashedOctopuses
    octopuses[octo[1]][octo[2]] = 0
  end

  if length(flashedOctopuses) == length(octopuses)*length(octopuses[1])
    global isSimultaneousFlash = true
    parts[2] = steps
  end
end


println(parts)
