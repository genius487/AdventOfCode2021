import strutils, algorithm

var
  file = readFile("21day10.txt").strip().splitLines()
  parts = [0,0]
  expect: string
  isIncomplete: bool
  score: int
  scoreboard: seq[int]

for line in file:
  expect = ""
  isIncomplete = true
  block scan:
    for i, chaar in line:
      case chaar
      of '(': expect.add(')')
      of '[': expect.add(']')
      of '{': expect.add('}')
      of '<': expect.add('>')
      else:
        if chaar == expect[^1]:
          expect = expect[0..<expect.high]
        else:
          isIncomplete = false

          case chaar
          of ')': parts[0].inc(3)
          of ']': parts[0].inc(57)
          of '}': parts[0].inc(1197)
          of '>': parts[0].inc(25137)
          else: discard
          
          break scan

  if isIncomplete:
    score = 0
    for chaar in reversed(expect):
      case chaar
      of ')': score = score*5+1
      of ']': score = score*5+2
      of '}': score = score*5+3
      of '>': score = score*5+4
      else: discard
      
    scoreboard.add(score)

parts[1] = scoreboard.sorted()[scoreboard.len div 2]

echo parts
