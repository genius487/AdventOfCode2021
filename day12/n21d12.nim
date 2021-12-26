import strutils, strscans, os, sets, sequtils, tables

var
  tunnels = readFile("21day12.txt").strip().splitLines()
  parts = [0,0]
  paths = {"start": @[@["start"]]}.toTable()
  newPaths = {"start": @[@["start"]]}.toTable()
  finalPaths: seq[seq[string]]
  newCaveImIn = initHashSet[string]() #seq[string]
  caveImIn = @["start"].toHashSet()
  cave1, cave2: string
  found: bool
  newCave, oldCave: string

while caveImIn.len != 0:
  echo caveImIn
  newPaths.clear
  newCaveImIn.clear

  for line in tunnels:
    if scanf(line, "$w-$w", cave1, cave2):
      
      for cave in caveImIn:
        found = false
        if cave != "end":
          #echo cave
          if cave == cave1:
            oldCave = cave1; newCave = cave2            
            found = true
          elif cave == cave2:
            oldCave = cave2; newCave = cave1
            found = true

        if found:
          for p in paths[oldcave]:
            if newCave[^1].isUpperAscii() or newCave notin p:
              if newCave == "end":
                finalPaths.add(concat(p,@[newCave]))
              else:
                if newCave in newPaths:
                  newPaths[newCave].add(concat(p,@[newCave]))
                else:
                  newPaths[newCave] = @[concat(p,@[newCave])]
                newCaveImIn.incl(newCave)

  paths = newPaths
  caveImIn = newCaveImIn
  newCaveImIn.clear

parts[0] = finalPaths.len


## Part 2 ##

var 
  finalPathsP2: seq[seq[string]]
  lowercaseFreq = initCountTable[string]()
  condition: bool

paths = {"start": @[@["start"]]}.toTable()
caveImIn = @["start"].toHashSet()

while caveImIn.len != 0:
  echo caveImIn
  newPaths.clear
  newCaveImIn.clear

  for line in tunnels:
    if scanf(line, "$w-$w", cave1, cave2):
      
      for cave in caveImIn:
        found = false
        if cave != "end":
          #echo cave
          if cave == cave1:
            oldCave = cave1; newCave = cave2            
            found = true
          elif cave == cave2:
            oldCave = cave2; newCave = cave1
            found = true

        if found:
          for p in paths[oldcave]:
            clear(lowercaseFreq)            
            condition = true
            
            for cave in p:
              if cave[^1].isLowerAscii():
                lowercaseFreq.inc(cave)

            if newCave in ["start", "end"]:
              if newCave notin p: condition = true
              else: condition = false
            elif lowercaseFreq.largest().val > 1:
              if newCave notin p: condition = true
              else: condition = false
            else:
              condition = true


            if newCave[^1].isUpperAscii() or condition:
              if newCave == "end":
                finalPathsP2.add(concat(p,@[newCave]))
              else:
                if newCave in newPaths:
                  newPaths[newCave].add(concat(p,@[newCave]))
                else:
                  newPaths[newCave] = @[concat(p,@[newCave])]
                newCaveImIn.incl(newCave)

  paths = newPaths
  caveImIn = newCaveImIn
  newCaveImIn.clear

parts[1] = finalPathsP2.len

echo parts

