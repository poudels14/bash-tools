import csv
import sys
import os

def has_key(key):
	with open(sys.argv[1], 'rb') as f:
	    reader = csv.reader(f)
	    for row in reader:
	    	if key == row[0]:
	        	return 1
	    return 0


def get_value(key):
	with open(sys.argv[1], 'rb') as f:
	    reader = csv.reader(f)
	    for row in reader:
	    	if key == row[0]:
	        	return row[1]

def remove(key):
	new_rows=[]
	with open(sys.argv[1], 'rb') as f:
			reader = csv.reader(f)
			for row in reader:
				if key != row[0]:
					new_rows.append(row)
				else:
					print("Removing " + row[0])
	with open(sys.argv[1], 'w') as f:
		writer = csv.writer(f, delimiter=',')
		for row in new_rows:
			writer.writerow(row)

def get_keys():
	out = ""
	with open(sys.argv[1], 'rb') as f:
	    reader = csv.reader(f)
	    for row in reader:
	    	out += row[0] + " "
	return out

if sys.argv[2] == "has_key":
	print(has_key (sys.argv[3]))
elif sys.argv[2] == "get_value":
	print(get_value(sys.argv[3]))
elif sys.argv[2] == "remove":
	remove(sys.argv[3])
elif sys.argv[2] == "get_keys":
	print(get_keys())
else:
	print("Invalid key:" + sys.argv[2])
