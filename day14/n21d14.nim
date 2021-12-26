import strutils, strscans, tables

var
  poylmerInstructs = readFile("21day14.txt").strip().splitLines()
  parts = [0,0]
  adjacentElements, polymerTemplate: string
  insertionElement: char
  rules = initTable[string, char]()
  numSteps = 40
  elemFreq: CountTable[char]
  pairFreq, newPairFreq: CountTable[string]
  

for line in poylmerInstructs:
  if scanf(line, "$w -> $c", adjacentElements, insertionElement):
    rules[adjacentElements] = insertionElement
  elif scanf(line, "$w", polymerTemplate):
    discard

elemFreq = polymerTemplate.toCountTable

for i in 0..polymerTemplate.high-1:
  pairFreq.inc(polymerTemplate[i..i+1])

for step in 1..numSteps:
  for p in pairFreq.keys:
    elemFreq.inc(rules[p], pairFreq[p])
    newPairFreq.inc($p[0] & $rules[p], pairFreq[p])
    newPairFreq.inc($rules[p] & $p[1], pairFreq[p])

  pairFreq = newPairFreq
  clear(newPairFreq)

  if step == 10:
    parts[0] = elemFreq.largest.val - elemFreq.smallest.val

parts[1] = elemFreq.largest.val - elemFreq.smallest.val

echo parts
