import strutils, sequtils

var
  file = readFile("21day11.txt").strip().splitLines()
  parts = [0,0]
  octopuses = newSeqWith(file.len, newSeq[int](file[0].len))
  steps: int
  flashedOctopuses, potentialFlash, newPotentialFlash: seq[seq[int]]
  isSimultaneousFlash = false

proc findAdjacents(point: seq[int], iMax: int, jMax: int): seq[seq[int]] =
  var
    i = point[0]
    j = point[1]
    adjacentsRef: seq[seq[int]]

  if i != iMax:
    adjacentsRef.add(@[i+1,j])
    if j != jMax: adjacentsRef.add(@[i+1,j+1])
    if j != 0: adjacentsRef.add(@[i+1,j-1])
  if i != 0: 
    adjacentsRef.add(@[i-1,j])
    if j != jMax: adjacentsRef.add(@[i-1,j+1])
    if j != 0: adjacentsRef.add(@[i-1,j-1])
  if j != jMax:
    adjacentsRef.add(@[i,j+1])
  if j != 0:
    adjacentsRef.add(@[i,j-1])

  return adjacentsRef


for i, line in file:
  for j, l in line:
    octopuses[i][j] = parseInt($l)

while not isSimultaneousFlash:
  inc steps
  flashedOctopuses = @[]

  for i in 0..octopuses.high:
    for j in 0..octopuses[0].high:    
      inc octopuses[i][j]
      potentialFlash = @[@[i,j]]

      while potentialFlash != []:
        newPotentialFlash = @[]

        for octo in potentialFlash:
          if octopuses[octo[0]][octo[1]] > 9 and octo notin flashedOctopuses:
            if steps <= 100: inc parts[0] #Num of Flashes
            flashedOctopuses.add(octo)

            for neighbour in findAdjacents(octo, octopuses.high, octopuses[0].high):
              inc octopuses[neighbour[0]][neighbour[1]]
              newPotentialFlash.add(neighbour)

        potentialFlash = newPotentialFlash

  for octo in flashedOctopuses:
    octopuses[octo[0]][octo[1]] = 0

  if flashedOctopuses.len == octopuses.len*octopuses[0].len:
    isSimultaneousFlash = true
    parts[1] = steps


echo parts
