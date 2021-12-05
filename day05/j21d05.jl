file = readlines("21day05.txt")
parts = [0,0]

perpendicularCrossings = Dict()
allCrossings = Dict()
lineregex = r"(\d+),(\d+) -> (\d+),(\d+)"

for line in file
	# Parsing every line in the input
  x1, y1, x2, y2 = match(lineregex, line).captures |> w->parse.(Int, w)

  # Finding all x and y values for that line
  if x1 < x2 xs = x1:x2
  else xs = x1:-1:x2
  end

  if y1 < y2 ys = y1:y2
  else ys = y1:-1:y2
  end

  # Stores all points on horizontal and vertical lines
  if x1 == x2 || y1 == y2
    for x in xs
      for y in ys
        allCrossings[(x,y)] = get(allCrossings, (x,y), 0) + 1
        perpendicularCrossings[(x,y)] = get(perpendicularCrossings, (x,y), 0) + 1
      end
    end
  else
  	# Stores all points on diagonal lines
    for p in zip(xs,ys)
      allCrossings[p] = get(allCrossings, p, 0) + 1
    end
  end
end

# Counts the points which overlap at least twice
for point in keys(perpendicularCrossings)
  if perpendicularCrossings[point] >= 2
    parts[1] += 1
  end
end

for point in keys(allCrossings)
  if allCrossings[point] >= 2
    parts[2] += 1
  end
end

println(parts)