with open("21day08.txt") as txt:
  file = txt.read().strip().splitlines()

parts = [0,0]
digitsets = [None] * 10

for line in file:
  signalPatts = line.split(" | ")[0].split()
  outputDigits = line.split(" | ")[1].split()

  for sig in signalPatts:
    signal = set(sig)
    if len(signal) == 2:
      digitsets[1] = signal
    elif len(signal) == 4:
      digitsets[4] = signal
    elif len(signal) == 3:
      digitsets[7] = signal
    elif len(signal) == 7:
      digitsets[8] = signal

  for sig in signalPatts:
    signal = set(sig)
    if len(signal) == 6:
      if (digitsets[7] | digitsets[4]).issubset(signal):
        digitsets[9] = signal
      elif digitsets[1].issubset(signal):
        digitsets[0] = signal
      else:
        digitsets[6] = signal

    elif len(signal) == 5:
      if digitsets[1].issubset(signal):
        digitsets[3] = signal
      elif len(signal.difference(digitsets[7] | digitsets[4])) == 1:
        digitsets[5] = signal
      else:
        digitsets[2] = signal

  output = ""
  for o in outputDigits:
    for d, digit in enumerate(digitsets):
      if set(o) == digit:
        output += str(d)
    if len(o) in [2,4,3,7]: parts[0] += 1 ## Part 1

  parts[1] += int(output) ## Part 2


print(parts)
