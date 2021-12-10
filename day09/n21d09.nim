import strutils, sequtils, times

var
  file = readFile("21day09.txt").strip().splitLines()
  parts = [0,1]
  heights = newSeqWith(file.len, newSeq[int](file[0].len))
  position, adjacents, setsAddedTo, joinedSet: seq[int]
  intPosition: int
  found: bool
  setOfRegions: seq[seq[int]]
  largestBasins = newSeq[int](3)
  tt = cpuTime()

proc findAdjacents(point: seq[int], iMax: int, jMax: int): seq[seq[int]] =
  var
    i = point[0]
    j = point[1]
    adjacentsRef: seq[seq[int]]

  if i != iMax:
    adjacentsRef.add(@[i+1,j])
  if i != 0: 
    adjacentsRef.add(@[i-1,j])
  if j != jMax:
    adjacentsRef.add(@[i,j+1])
  if j != 0:
    adjacentsRef.add(@[i,j-1])

  return adjacentsRef


for i, line in file:
  for j, l in line:
    heights[i][j] = parseInt($l)

for i, line in heights:
  for j, l in line:

    ## Part 1 ##

    position = @[i,j]
    adjacents = @[]
    
    for point in findAdjacents(position, heights.high, line.high):
      adjacents.add(heights[point[0]][point[1]])

    if l < min(adjacents): 
      parts[0] += 1 + l ## Part 1 ##

    ## Part 2 ##

    intPosition = i*2*line.len + j

    if l < 9:
      setsAddedTo = @[]

      if setOfRegions == []:
        setOfRegions.add(@[intPosition])
      else:
        found = false
        for s in 0..setOfRegions.high:
          if intPosition-max(setOfRegions[s]) <= 2*line.len:

            block findNeighbour:
              for i in 0..setOfRegions[s].high:
                if intPosition-setOfRegions[s][i] in [1, 2*line.len]:
                  found = true
                  setOfRegions[s].add(intPosition)
                  setsAddedTo.add(s)
                  break findNeighbour

        if setsAddedTo.deduplicate.len > 1:
          joinedSet = setOfRegions[setsAddedTo[0]] & setOfRegions[setsAddedTo[1]]
          setOfRegions.del(setsAddedTo[1])
          setOfRegions.del(setsAddedTo[0])
          setOfRegions.add(joinedSet)

        if not found:
          setOfRegions.add(@[intPosition])

for g, group in setOfRegions:
  setOfRegions[g] = group.deduplicate

  if setOfRegions[g].len > largestBasins[0]:
    largestBasins[2] = largestBasins[1]
    largestBasins[1] = largestBasins[0]
    largestBasins[0] = setOfRegions[g].len
  elif setOfRegions[g].len > largestBasins[1]:
    largestBasins[2] = largestBasins[1]
    largestBasins[1] = setOfRegions[g].len
  elif setOfRegions[g].len > largestBasins[2]:
    largestBasins[2] = setOfRegions[g].len

for l in largestBasins:
  parts[1] *= l

echo parts
echo cpuTime()-tt
