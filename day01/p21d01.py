

with open("21day01.txt") as txt:
	depths = [int(line) for line in txt.read().splitlines()]

parts = [0,0]

for ind in range(1,len(depths)):
	if depths[ind] > depths[ind-1]:
		parts[0] += 1
	if ind >= 3:
		if depths[ind] > depths[ind-3]:
			parts[1] += 1

print(parts)