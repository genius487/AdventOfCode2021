with open("21day10.txt") as txt:
  file = txt.read().strip().splitlines()

parts = [0,0]
scoreboard = []

for line in file:
  expect = ""
  ind = 0

  isIncomplete = True
  while isIncomplete and ind < len(line):
    chaar = line[ind]

    if chaar == '(': expect += ')'
    elif chaar == '[': expect += ']'
    elif chaar == '{': expect += '}'
    elif chaar == '<': expect += '>'
    elif chaar == expect[-1]: expect = expect[:-1]
    else:
      isIncomplete = False

      if chaar == ')': parts[0] += 3
      elif chaar == ']': parts[0] += 57
      elif chaar == '}': parts[0] += 1197
      elif chaar == '>': parts[0] += 25137
    
    ind += 1

  if isIncomplete:
    score = 0
    for chaar in reversed(expect):
      if chaar == ')': score = score*5+1
      elif chaar == ']': score = score*5+2
      elif chaar == '}': score = score*5+3
      elif chaar == '>': score = score*5+4
    
    scoreboard.append(score)

parts[1] = sorted(scoreboard)[len(scoreboard) // 2]

print(parts)
