import matplotlib.pyplot as plt
import time
import random
from collections import deque
import numpy as np
import sys, serial
from pylab import pause
ser = serial.Serial('/dev/ttyUSB0', 9600, timeout=1)#timeout=0, rtscts=1)
archivo = open("datos.txt", "w")
from random import randrange
i=0
# simulates input from serial port
def random_gen():
    while True:
	line = ser.readline()
	val = float(line)
	archivo.write(str(val)+'\n')
	yield val
	time.sleep(0.1)

try:
    # Trabajar
    a1 = deque([0]*100)
    ax = plt.axes(xlim=(0, 20), ylim=(0, 10))
    ax.grid(True)
    d = random_gen()

    line, = plt.plot(a1)
    plt.ion()
    plt.ylim([0,10])
    plt.show()

    while(1):
        a1.appendleft(next(d))
	datatoplot = a1.pop()
	line.set_ydata(a1)
	txt=plt.text(5, 10, "voltaje:"+str(a1[0]), fontsize=18, ha='center', va='top')
	plt.draw()
	print a1[0]
	i += 1
	time.sleep(0.1)
	plt.pause(0.0001)                       #add this it will be OK.
	txt.remove()

except KeyboardInterrupt:
    # quit
    ser.close()
    sys.exit()

