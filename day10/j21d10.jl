file = readlines("21day10.txt")

parts = [0,0]
scoreboard = []

for line in file
  expect = ""
  ind = 1

  isIncomplete = true
  while isIncomplete && ind <= length(line)
    chaar = line[ind]

    if chaar == '(' expect *= ')'
    elseif chaar == '[' expect *= ']'
    elseif chaar == '{' expect *= '}'
    elseif chaar == '<' expect *= '>'
    elseif chaar == expect[end] expect = expect[1:end-1]
    else
      isIncomplete = false

      if chaar == ')' parts[1] += 3
      elseif chaar == ']' parts[1] += 57
      elseif chaar == '}' parts[1] += 1197
      elseif chaar == '>' parts[1] += 25137
      end

    end
    
    ind += 1

  end
  
  if isIncomplete
    score = 0
    for chaar in reverse(expect)
      if chaar == ')' score = score*5+1
      elseif chaar == ']' score = score*5+2
      elseif chaar == '}' score = score*5+3
      elseif chaar == '>' score = score*5+4
      end
    end
    
    push!(scoreboard, score)

  end
end

parts[2] = sort(scoreboard)[length(scoreboard) ÷ 2 + 1]


println(parts)
