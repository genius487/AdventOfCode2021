import strutils, tables

var
  data = readFile("21day20.txt").strip().split("\n\n")
  parts = [0,0]
  enchancementAlg = data[0]
  image = data[1].split('\n')
  inputIndex = initOrderedTable[seq[int],string]()
  outputIndex = initOrderedTable[seq[int],string]()
  binString, infFill: string
  newPixel: char
  turns: int
  numLoops = 50

for i, row in image:
  for j, pixel in row:
    if pixel == '.': inputIndex[@[i,j]] = "0"
    else: inputIndex[@[i,j]] = "1"

while turns < numLoops:
  if turns == 2:
    for v in inputIndex.values:
      if v == "1": inc parts[0]

  inc turns
  clear(outputIndex)

  if enchancementAlg[0] == '#':
    if turns mod 2 == 1: infFill = "0"
    else: infFill = "1"
  else: infFill = "0"

  for i in 0-turns..image.high+turns:
    for j in 0-turns..image[0].high+turns:
      binString = ""

      for x in [-1,0,1]:
        for y in [-1,0,1]:
          binString.add(inputIndex.mgetOrPut(@[i+x,j+y], infFill))

      newPixel = enchancementAlg[parseBinInt(binString)]

      if newPixel == '.': outputIndex[@[i,j]] = "0"
      else: outputIndex[@[i,j]] = "1"


  inputIndex = outputIndex


for v in inputIndex.values:
  if v == "1": inc parts[1]

echo parts