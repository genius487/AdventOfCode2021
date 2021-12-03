

with open("21day03.txt") as txt:
	file = txt.read().strip().splitlines()

parts = [0,0]
binCount = [0]*len(file[0])
binGamma = []
binEpsilon = []

for line in file:
	for i, b in enumerate(line):
		if b == '1': binCount[i] += 1
		else: binCount[i] -= 1

for b in binCount:
	if b > 0:
		binGamma.append('1')
		binEpsilon.append('0')
	else:
		binGamma.append('0')
		binEpsilon.append('1')

parts[0] = int("".join(binGamma), base=2)*int("".join(binEpsilon), base=2)


## PART 2 ##

oxysearch = file
co2search = file
ind = 0

while len(oxysearch) > 1:
	num1s = []
	num0s = []

	for line in oxysearch:
		if line[ind] == '1': num1s.append(line)
		else: num0s.append(line)

	if len(num1s) >= len(num0s): oxysearch = num1s
	else: oxysearch = num0s

	ind += 1

ind = 0

while len(co2search) > 1:
	num1s = []
	num0s = []

	for line in co2search:
		if line[ind] == '1': num1s.append(line)
		else: num0s.append(line)

	if len(num0s) <= len(num1s): co2search = num0s
	else: co2search = num1s

	ind += 1

parts[1] = int(oxysearch[0], base=2)*int(co2search[0], base=2)


print(parts)

