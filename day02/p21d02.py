

with open("21day02.txt") as txt:
	file = txt.read().strip().splitlines()

parts = [0,0]
forward = 0
depth = 0

for line in file:
	instruct = line.split(" ")

	if instruct[0] == "forward":
		forward += int(instruct[1])
	elif instruct[0] == "down":
		depth += int(instruct[1])
	elif instruct[0] == "up":
		depth -= int(instruct[1])

parts[0] = forward*depth


## PART 2 ##

forward = 0
depth = 0
aim = 0

for line in file:
	instruct = line.split(" ")

	if instruct[0] == "forward":
		forward += int(instruct[1])
		depth += aim*int(instruct[1]) 
	elif instruct[0] == "down":
		aim += int(instruct[1])
	elif instruct[0] == "up":
		aim -= int(instruct[1])

parts[1] = forward*depth

print(parts)