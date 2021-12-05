import strutils, tables, strscans, sequtils

var
  file = readFile("21day05.txt").strip().splitLines()
  parts = [0,0]
  x1, x2, y1, y2: int
  perpendicularCrossings = initCountTable[(int,int)]()
  allCrossings = initCountTable[(int,int)]()
  xs, ys: seq[int]

for line in file:
  # Parsing every line in the input
  if scanf(line, "$i,$i -> $i,$i", x1, y1, x2, y2):

    # Finding all x and y values for that line
    if x1 < x2: xs = countup(x1, x2).toSeq()
    else: xs = countdown(x1, x2).toSeq()

    if y1 < y2: ys = countup(y1, y2).toSeq()
    else: ys = countdown(y1, y2).toSeq()

    # Stores all points on horizontal and vertical lines
    if x1 == x2 or y1 == y2:
      for x in xs:
        for y in ys:
          allCrossings.inc((x,y))
          perpendicularCrossings.inc((x,y))
    else:
      # Stores all points on diagonal lines
      for i in 0..xs.len-1:
        allCrossings.inc((xs[i],ys[i]))

# Counts the points which overlap at least twice
for point in perpendicularCrossings.keys():
  if perpendicularCrossings[point] >= 2:
    inc parts[0]

for point in allCrossings.keys():
  if allCrossings[point] >= 2:
    inc parts[1]

echo parts