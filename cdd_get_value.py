import csv
import sys

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


if sys.argv[2] == "has_key":
	print has_key (sys.argv[3])
elif sys.argv[2] == "get_value":
	print get_value (sys.argv[3])
else:
	print "Invalid"