import strutils, tables, sequtils

var
  file = readFile("21day06.txt").strip().split(',')
  parts = [0,0]
  fish: seq[int]
  numFish = file.len
  fishCount = initCountTable[int]()
  newFishCount = initCountTable[int]()
  numDays = 256

# Convert chars to int
for time in file:
  fish.add(parseInt(time))

# Count initial number of fish with days until they give birth
fishCount = fish.toCountTable()


for day in 1..numDays:
  for f in countdown(8,0):

    # When fish gives birth, reset mother's timer, declare baby's time
    # and increase count of number of fish by one 
    if f == 0:
      newFishCount[6] = fishCount[f] + fishCount[7]
      newFishCount[8] = fishCount[f]
      numFish.inc(fishCount[f])
    else:
      # Decreases days until birth for fish with 
      # at least 1 day until giving birth
      newFishCount[f-1] = fishCount[f]

  # Reset fish timer tally
  fishCount = newFishCount

  if day == 80: parts[0] = numFish

parts[1] = numFish

echo parts

 
