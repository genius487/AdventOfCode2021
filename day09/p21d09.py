from copy import deepcopy

with open("21day09.txt") as txt:
  file = txt.read().strip().splitlines()

parts = [0,1]
heights = [[0 for j in range(len(file[0]))] for i in range(len(file))]
largestBasins = [0,0,0]

def findAdjacents(point, iMax, jMax):
  i = point[0]
  j = point[1]
  adjacentsRef = []

  if i != iMax: adjacentsRef.append([i+1,j])
  if i != 0: adjacentsRef.append([i-1,j])
  if j != jMax: adjacentsRef.append([i,j+1])
  if j != 0: adjacentsRef.append([i,j-1])

  return adjacentsRef


for i, line in enumerate(file):
  for j, l in enumerate(line):
    heights[i][j] = int(l)

for i, line in enumerate(heights):
  for j, l in enumerate(line):
    if l < 9:

      ## Part 1 ##

      position = [i,j]
      adjacents = []
      
      for point in findAdjacents(position, len(heights)-1, len(heights[0])-1):
        adjacents.append(heights[point[0]][point[1]])

      if l < min(adjacents): 
        parts[0] += 1 + l

        ## PART 2 ##

        basin = [position]
        potentialLowsInBasin = findAdjacents(position, len(heights)-1, len(heights[0])-1)

        while potentialLowsInBasin != []:
          newPotentialLowsInBasin = []

          for level in potentialLowsInBasin:
            if heights[level[0]][level[1]] < 9 and level not in basin:
              basin.append(level)
              for point in findAdjacents(level, len(heights)-1, len(heights[0])-1):
                newPotentialLowsInBasin.append(point)

          potentialLowsInBasin = deepcopy(newPotentialLowsInBasin)

        if len(basin) > largestBasins[0]:
          largestBasins[2] = largestBasins[1]
          largestBasins[1] = largestBasins[0]
          largestBasins[0] = len(basin)
        elif len(basin) > largestBasins[1]:
          largestBasins[2] = largestBasins[1]
          largestBasins[1] = len(basin)
        elif len(basin) > largestBasins[2]:
          largestBasins[2] = len(basin)

for l in largestBasins:
  parts[1] *= l

print(parts)
print(largestBasins)