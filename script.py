import sys

if len(sys.argv) != 3:
	print("Wrong input to python")

else:
	data = sys.argv[1].split('\n')
	data.pop(0)
	list_to_erase = []
	for i in data:
		row = i.split()
		if row[0].find(sys.argv[2]) == -1:
			list_to_erase.append(row[2])
	
	for i in list_to_erase:
		print(i)
