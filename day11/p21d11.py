from copy import deepcopy

with open("21day11.txt") as txt:
  file = txt.read().strip().splitlines()

parts = [0,0]
octopuses = [[0 for j in range(len(file[0]))] for i in range(len(file))]
steps = 0
isSimultaneousFlash = False

def findAdjacents(point, iMax, jMax):
  i = point[0]
  j = point[1]
  adjacentsRef = []

  if i != iMax:
    adjacentsRef.append([i+1,j])
    if j != jMax: adjacentsRef.append([i+1,j+1])
    if j != 0: adjacentsRef.append([i+1,j-1])
  if i != 0: 
    adjacentsRef.append([i-1,j])
    if j != jMax: adjacentsRef.append([i-1,j+1])
    if j != 0: adjacentsRef.append([i-1,j-1])
  if j != jMax:
    adjacentsRef.append([i,j+1])
  if j != 0:
    adjacentsRef.append([i,j-1])

  return adjacentsRef


for i, line in enumerate(file):
  for j, l in enumerate(line):
    octopuses[i][j] = int(l)

while not isSimultaneousFlash:
  steps += 1
  flashedOctopuses = []

  for i in range(len(octopuses)):
    for j in range(len(octopuses[0])):    
      octopuses[i][j] += 1
      potentialFlash = [[i,j]]

      while potentialFlash != []:
        newPotentialFlash = []

        for octo in potentialFlash:
          if octopuses[octo[0]][octo[1]] > 9 and octo not in flashedOctopuses:
            if steps <= 100: parts[0] += 1 #Num of Flashes
            flashedOctopuses.append(octo)

            for neighbour in findAdjacents(octo, len(octopuses)-1, len(octopuses[0])-1):
              octopuses[neighbour[0]][neighbour[1]] += 1
              newPotentialFlash.append(neighbour)

        potentialFlash = deepcopy(newPotentialFlash)

  for octo in flashedOctopuses:
    octopuses[octo[0]][octo[1]] = 0

  if len(flashedOctopuses) == len(octopuses)*len(octopuses[0]):
    isSimultaneousFlash = True
    parts[1] = steps


print(parts)
