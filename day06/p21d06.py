from copy import deepcopy

with open("21day06.txt") as txt:
	# Convert chars to int
	fish = [int(f) for f in txt.read().strip().split(',')]

parts = [0,0]
fishCount = {k: 0 for k in range(0,9)}
newFishCount = {k: 0 for k in range(0,9)}
numDays = 256
numFish = len(fish)

# Count initial number of fish with days until they give birth
for f in fish:
  fishCount[f] += 1

for day in range(1,numDays+1):
  for f in range(8,-1,-1):
    # When fish gives birth, reset mother's timer, 
    # declare baby's time and increase count of number of fish by one 
    if f == 0:
      newFishCount[6] = fishCount[f] + fishCount[7]
      newFishCount[8] = fishCount[f]
      numFish += fishCount[f]
    else:
      # Decreases days until birth for fish with 
      # at least 1 day until giving birth
      newFishCount[f-1] = fishCount[f]

  # Reset fish timer tally
  fishCount = deepcopy(newFishCount)

  if day == 80:	parts[0] = numFish

parts[1] = numFish

print(parts)
