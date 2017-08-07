#!/usr/bin/env python

with open("new_dump", mode='w') as dm:
	with open("dump", mode='r') as dp:
		for y in dp:
			k = y.split(" ")[2:]
			#print(k)
			for byte in k:
				if (byte != " ") and (byte != "\n") and (byte != ''):
					dm.write("0x"+byte+',')
			dm.write('\n')	
