file = readlines("21day08.txt")

parts = [0,0]
digitsets = fill(Set([]),10)

for line in file
  signalPatts = split(split(line, " | ")[1])
  outputDigits = split(split(line, " | ")[2])

  for sig in signalPatts
  	signal = Set(sig)
    if length(signal) == 2
      digitsets[2] = signal
    elseif length(signal) == 4
      digitsets[5] = signal
    elseif length(signal) == 3
      digitsets[8] = signal
    elseif length(signal) == 7
      digitsets[9] = signal
    end
  end

  for sig in signalPatts
  	signal = Set(sig)
    if length(signal) == 6
      if (digitsets[8] ∪ digitsets[5]) ⊆ signal
        digitsets[10] = signal
      elseif digitsets[2] ⊆ signal
        digitsets[1] = signal
      else
        digitsets[7] = signal
      end

    elseif length(signal) == 5
      if digitsets[2] ⊆ signal
        digitsets[4] = signal
      elseif length(setdiff(signal, (digitsets[8] ∪ digitsets[5]))) == 1
        digitsets[6] = signal
      else
        digitsets[3] = signal
      end
    end
  end

  output = ""
  for o in outputDigits
    for (d, digit) in enumerate(digitsets)
      if Set(o) == digit
        output *= string(d-1)
      end
    end
    if length(o) in [2,4,3,7] 
    	parts[1] += 1 ## Part 1
    end
  end

  parts[2] += parse(Int, output) ## Part 2

end

println(parts)
