import strutils, sets

var
  file = readFile("21day08.txt").strip().splitLines()
  parts = [0,0]
  digitsets: array[10, HashSet[char]]
  signal: HashSet[char]
  outputDigits: seq[string]
  signalPatts: seq[string]
  output: string

for line in file:
  signalPatts = line.split(" | ")[0].split()
  outputDigits = line.split(" | ")[1].split()

  for sig in signalPatts:
    signal = toHashSet(sig)
    case signal.len
    of 2: digitsets[1] = signal
    of 4: digitsets[4] = signal
    of 3: digitsets[7] = signal
    of 7: digitsets[8] = signal
    else: discard

  for sig in signalPatts:
    signal = toHashSet(sig)
    case signal.len
    of 6:
      if (digitsets[7] + digitsets[4]) < signal:
        digitsets[9] = signal
      elif digitsets[1] < signal:
        digitsets[0] = signal
      else:
        digitsets[6] = signal

    of 5:
      if digitsets[1] < signal:
        digitsets[3] = signal
      elif len(signal - (digitsets[7] + digitsets[4])) == 1:
        digitsets[5] = signal
      else:
        digitsets[2] = signal

    else: discard

  output = ""
  for o in outputDigits:
    for d, digit in digitsets:
      if toHashSet(o) == digit:
        output.add($d)
    if o.len in [2,4,3,7]: inc parts[0] ## Part 1

  parts[1] += parseInt(output) ## Part 2


echo parts
