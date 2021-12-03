import strutils

var
  file = readFile("21day03.txt").strip().splitLines()
  parts = [0,0]
  binCount = newSeq[int](file[0].len)
  binGamma, binEpsilon: string
  oxysearch = file
  co2search = file
  num1s, num0s: seq[string]
  ind: int

for line in file:
  for i, b in line:
    if b == '1': inc binCount[i]
    else: dec binCount[i]

for b in binCount:
  if b > 0:
    binGamma.add('1')
    binEpsilon.add('0')
  else:
    binGamma.add('0')
    binEpsilon.add('1')

parts[0] = parseBinInt(binGamma)*parseBinInt(binEpsilon)

## PART 2 ##

while oxysearch.len > 1:
  num1s = @[]
  num0s = @[]

  for line in oxysearch:
    if line[ind] == '1': num1s.add(line)
    else: num0s.add(line)

  if num1s.len >= num0s.len: oxysearch = num1s
  else: oxysearch = num0s

  inc ind

ind = 0

while co2search.len > 1:
  num1s = @[]
  num0s = @[]

  for line in co2search:
    if line[ind] == '1': num1s.add(line)
    else: num0s.add(line)

  if num0s.len <= num1s.len: co2search = num0s
  else: co2search = num1s

  inc ind

parts[1] = parseBinInt(oxysearch[0])*parseBinInt(co2search[0])

echo parts
