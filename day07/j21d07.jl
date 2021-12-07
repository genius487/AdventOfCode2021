crabs = [parse(Int, c) for c in split(readline("21day07.txt"), ',')]

parts = [0,0]


let leastFuel = 999999, sweetSpot = false, moveTo = 0, fuel = 0

	while !sweetSpot
    for crab in crabs
      steps = abs(crab-moveTo)
      fuel += steps
    end

    if fuel < leastFuel
      leastFuel = fuel
    else
      sweetSpot = true
    end

    moveTo += 1
    fuel = 0
  end

  parts[1] = leastFuel

end


## PART 2 ##

let leastFuel = 999999999, sweetSpot = false, moveTo = 0, fuel = 0

  while !sweetSpot
    for crab in crabs
      steps = abs(crab-moveTo)
      fuel += (steps*(steps+1) / 2)
    end

    if fuel < leastFuel
      leastFuel = fuel
    else
      sweetSpot = true
    end

    moveTo += 1
    fuel = 0
  end

  parts[2] = leastFuel

end

println(parts)
