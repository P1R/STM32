import serial
ser = serial.Serial('/dev/ttyUSB0', 9600, timeout=1)#timeout=0, rtscts=1)
i = 0
while i <10:
	line = ser.readline()
	print line
	i+=1
'''
A = float(line);
print type(A)
print A
'''
ser.close()
