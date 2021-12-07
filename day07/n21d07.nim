import strutils, sequtils, tables

var
  file = readFile("21day07.txt").strip().split(',').map(parseInt)
  parts = [0,0]
  crabs = file.toCountTable
  leastFuel = 999999
  sweetSpot = false
  steps, moveTo, fuel: int

while not sweetSpot:
  for k in crabs.keys:
    steps = abs(k-moveTo)
    fuel.inc(steps*crabs[k])

  if fuel < leastFuel:
    leastFuel = fuel
  else:
    sweetSpot = true

  inc moveTo
  fuel = 0

parts[0] = leastFuel


## PART 2 ##

leastFuel = 999999999
sweetSpot = false
moveTo = 0
fuel = 0

while not sweetSpot:
  for k in crabs.keys:
    steps = abs(k-moveTo)
    fuel.inc((steps*(steps+1) div 2)*crabs[k])

  if fuel < leastFuel:
    leastFuel = fuel
  else:
    sweetSpot = true

  inc moveTo
  fuel = 0

parts[1] = leastFuel

echo parts

 
