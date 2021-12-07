with open("21day07.txt") as txt:
  crabs = [int(c) for c in txt.read().strip().split(',')]

parts = [0,0]
leastFuel = 999999
sweetSpot = False
moveTo = 0
fuel = 0

while not sweetSpot:
  for crab in crabs:
    steps = abs(crab-moveTo)
    fuel += steps

  if fuel < leastFuel:
    leastFuel = fuel
  else:
    sweetSpot = True

  moveTo += 1
  fuel = 0

parts[0] = leastFuel


## PART 2 ##

leastFuel = 999999999
sweetSpot = False
moveTo = 0
fuel = 0

while not sweetSpot:
  for crab in crabs:
    steps = abs(crab-moveTo)
    fuel += (steps*(steps+1) / 2)

  if fuel < leastFuel:
    leastFuel = fuel
  else:
    sweetSpot = True

  moveTo += 1
  fuel = 0

parts[1] = leastFuel

print(parts)