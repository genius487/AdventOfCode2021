import strutils

var
  file = readFile("21day02.txt").strip().splitLines()
  instruct: seq[string]
  parts = [0,0]
  forward, depth, aim: int

for line in file:
  instruct = line.split(" ")
  
  case instruct[0]
  of "forward":
    forward.inc(parseInt(instruct[1]))
  of "down":
    depth.inc(parseInt(instruct[1]))
  of "up":
    depth.dec(parseInt(instruct[1]))
  else:
    discard

parts[0] = forward*depth


## PART 2 ##

forward = 0
depth = 0

for line in file:
  instruct = line.split(" ")
  
  case instruct[0]
  of "forward":
    forward.inc(parseInt(instruct[1]))
    depth.inc(aim*parseInt(instruct[1]))
  of "down":
    aim.inc(parseInt(instruct[1]))
  of "up":
    aim.dec(parseInt(instruct[1]))
  else:
    discard

parts[1] = forward*depth


echo parts