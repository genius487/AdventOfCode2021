# Convert chars to int
fish = readline("21day06.txt") |> w ->split(w, ',') |> w -> parse.(Int, w)

parts = [0,0]
fishCount = Dict{Int, Int}(i => 0 for i in 8:-1:0)
newFishCount = Dict{Int, Int}(i => 0 for i in 8:-1:0)
numDays = 256
numFish = length(fish)

# Count initial number of fish with days until they give birth
for f in fish
  fishCount[f] += 1
end

for day in 1:numDays
  for f in 8:-1:0
    # When fish gives birth, reset mother's timer, 
    # declare baby's time and increase count of number of fish by one 
    if f == 0
      newFishCount[6] = fishCount[f] + fishCount[7]
      newFishCount[8] = fishCount[f]
      global numFish += fishCount[f]
    else
      # Decreases days until birth for fish with 
      # at least 1 day until giving birth
      newFishCount[f-1] = fishCount[f]
    end
  end

  # Reset fish timer tally
  global fishCount = deepcopy(newFishCount)

  if day == 80 parts[1] = numFish
  end

end

parts[2] = numFish

println(parts)
