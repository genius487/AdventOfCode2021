import strutils

var
  file = readFile("21day01.txt").strip().splitLines()
  depths: seq[int]
  parts = [0,0]

for line in file:
  depths.add(parseInt(line))

for ind in 1..depths.len-1:
  if depths[ind] > depths[ind-1]:
    inc parts[0]

for ind in 3..depths.len-1:
  if depths[ind] > depths[ind-3]:
    inc parts[1]


echo parts