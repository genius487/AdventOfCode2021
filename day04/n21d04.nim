import strutils, sequtils

var
  file = readFile("21day04.txt").strip().split("\n\n")
  parts = [0,0]
  calls = file[0].split(',')
  cardrows = newSeqWith(5, newSeq[int](5))
  cardcols = newSeqWith(5, newSeq[int](5))
  turns, cardtotal: int
  bingo: bool
  winningturns = 999
  losingturns = -999

for c in file[1..^1]:
  cardrows = newSeqWith(5, newSeq[int](5))
  cardcols = newSeqWith(5, newSeq[int](5))
  turns = -1
  bingo = false
  cardtotal = 0

  for i, line in c.split('\n').pairs():
    for j, num in line.splitWhitespace().pairs():
      cardrows[i][j] = parseInt(num)
      cardcols[j][i] = parseInt(num)
      cardtotal.inc(parseInt(num))
     
  while not bingo:
    inc turns
    for i in 0..cardrows.len-1:
      for j in 0..cardrows[0].len-1:
        if cardrows[i][j] == parseInt(calls[turns]):
          cardtotal.dec(parseInt(calls[turns]))
          cardrows[i][j] = -1
          cardcols[j][i] = -1

          for line in cardrows & cardcols:
            if line == [-1,-1,-1,-1,-1]:
              bingo = true

  if turns < winningturns:
    winningturns = turns
    parts[0] = cardtotal*parseInt(calls[turns])

  if turns > losingturns:
    losingturns = turns
    parts[1] = cardtotal*parseInt(calls[turns])

echo parts