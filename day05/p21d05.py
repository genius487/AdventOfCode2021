import re

with open("21day05.txt") as txt:
	file = txt.read().strip().splitlines()

parts = [0,0]
perpendicularCrossings = {}
allCrossings = {}
lineregex = r"(\d+),(\d+) -> (\d+),(\d+)"

for line in file:
  # Parsing every line in the input
  x1, y1, x2, y2 = [int(p) for p in re.search(lineregex, line).groups()]

  # Finding all x and y values for that line
  if x1 < x2: xs = range(x1, x2+1)
  else: xs = range(x1, x2-1, -1)

  if y1 < y2: ys = range(y1, y2+1)
  else: ys = range(y1, y2-1, -1)

  # Stores all points on horizontal and vertical lines
  if x1 == x2 or y1 == y2:
    for x in xs:
      for y in ys:
        allCrossings[(x,y)] = allCrossings.get((x,y),0) + 1
        perpendicularCrossings[(x,y)] = perpendicularCrossings.get((x,y),0) + 1
  else:
    # Stores all points on diagonal lines
    for p in zip(xs,ys):
      allCrossings[p] = allCrossings.get(p,0) + 1

# Counts the points which overlap at least twice
for point in perpendicularCrossings:
  if perpendicularCrossings[point] >= 2:
    parts[0] += 1

for point in allCrossings:
  if allCrossings[point] >= 2:
    parts[1] += 1

print(parts)