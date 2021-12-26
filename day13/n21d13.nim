import strutils, strscans, sequtils

var
  manualPage = readFile("21day13.txt").strip().splitLines()
  parts = [0,0]
  foldline, xCol, yRow, numFolds, numRows, numCols: int
  axis: string
  folds, code: seq[string]
  dots, newDots: seq[seq[int]]

for line in manualPage:
  if scanf(line, "$i,$i", xCol, yRow):
    dots.add(@[xCol, yRow])
  elif scanf(line, "fold along $w=$i", axis, foldline): 
    folds.add($axis & "," & $foldline)

for f in folds:
  newDots = @[]

  if scanf(f, "$w,$i", axis, foldline):

    for dot in dots:
      xCol = dot[0]; yRow = dot[1]

      if axis == "y" and yRow > foldline:
        yRow -= 2*(yRow - foldline)
      elif axis == "x" and xCol > foldline:
        xCol -= 2*(xCol - foldline)
      
      newDots.add(@[xCol, yRow])

  newDots = newDots.deduplicate

  if numFolds == 0:
    parts[0] = newDots.len

  dots = newDots
  inc numFolds

## Part 2 ##

for dot in dots:
  if dot[0] > numCols: numCols = dot[0]
  if dot[1] > numRows: numRows = dot[1]

for n in 0..numRows:
  code.add(' '.repeat(numCols+1))

for dot in dots:
  xCol = dot[0]; yRow = dot[1]

  code[yRow][xCol] = '#'

echo parts
echo "Part 2 below"

for line in code:
  echo line
