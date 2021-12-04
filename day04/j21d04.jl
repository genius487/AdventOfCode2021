file = split(read("21day04.txt", String), "\n\n")
parts = [0,0]

calls = [parse(Int, n) for n in split(file[1], ',')]
winningturns = 999
losingturns = -999

for c in file[2:end]
  cardrows = [[0 for j in 1:5] for i in 1:5]
  cardcols = [[0 for j in 1:5] for i in 1:5]
  turns = 0
  bingo = false
  cardtotal = 0

  for (i, line) in enumerate(split(c,'\n'))
    for (j, num) in enumerate(split(line))
      cardrows[i][j] = parse(Int, num)
      cardcols[j][i] = parse(Int, num)
      cardtotal += parse(Int, num)
    end
  end
  
  while !bingo
    turns += 1
    for i in 1:length(cardrows)
      for j in 1:length(cardrows[1])
        if cardrows[i][j] == calls[turns]
          cardtotal -= calls[turns]
          cardrows[i][j] = -1
          cardcols[j][i] = -1

          for line in vcat(cardrows, cardcols)
            if line == [-1,-1,-1,-1,-1]
              bingo = true
            end
          end

        end
      end
    end
  end

  if turns < winningturns
    global winningturns = turns
    parts[1] = cardtotal*calls[turns]
  end

  if turns > losingturns
    global losingturns = turns
    parts[2] = cardtotal*calls[turns]
  end

end

println(parts)