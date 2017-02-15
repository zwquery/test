#!/usr/bin/python
# -*- coding: utf-8 -*-
# This basic script requires all files are to be in hardcoded C:\folder\ folder
#
# It DOES NOT save files before ! Hopefully, XOR is reversible   :)

import os
import glob


os.system('cls')



print "Basic Cypher system by ZwQuery"
print "*******************************
print ""
print "Only for Python 2.7"
print ""
print ""
print ""
print ""


name = raw_input("Press a key to encrypt files from here...")

def xor(data, key):
	l = len(key)
	return bytearray((
		(data[i] ^ key[i % l]) for i in range(0,len(data))
	))


for filename in glob.iglob("C:\\folder\\*.*"):
    with open(filename, "r+b") as f:
	data = bytearray(open(filename, 'rb').read())
	key = bytearray([0x36,0x30,0x34])
	f = open (filename, 'wb')
	pom = xor(data, key)
	f.write(pom)
	print filename + " destroyed !"
	print ""
	print "Successfully broken !     :)"