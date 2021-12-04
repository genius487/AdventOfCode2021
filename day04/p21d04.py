with open("21day04.txt") as txt:
	file = txt.read().strip().split("\n\n")

parts = [0,0]
calls = [int(n) for n in file[0].split(',')]
winningturns = 999
losingturns = -999

for c in file[1:-1]:
  cardrows = [[0 for j in range(5)] for i in range(5)]
  cardcols = [[0 for j in range(5)] for i in range(5)]
  turns = -1
  bingo = False
  cardtotal = 0

  for i, line in enumerate(c.split('\n')):
    for j, num in enumerate(line.split()):
      cardrows[i][j] = int(num)
      cardcols[j][i] = int(num)
      cardtotal += int(num)
  
  while not bingo:
    turns += 1
    for i in range(len(cardrows)):
      for j in range(len(cardrows[0])):
        if cardrows[i][j] == calls[turns]:
          cardtotal -= calls[turns]
          cardrows[i][j] = -1
          cardcols[j][i] = -1

          for line in cardrows + cardcols:
            if line == [-1,-1,-1,-1,-1]:
              bingo = True

  if turns < winningturns:
    winningturns = turns
    parts[0] = cardtotal*calls[turns]

  if turns > losingturns:
    losingturns = turns
    parts[1] = cardtotal*calls[turns]

print(parts)