import matplotlib.pyplot as plt
import time
from collections import deque
import numpy as np
import sys, serial
ser = serial.Serial('/dev/ttyUSB0', 9600, timeout=1)#timeout=0, rtscts=1)


# simulates input from serial port
def random_gen():
    while True:
        line = ser.readline()
        val = float(line)
        yield val
        time.sleep(0.1)


a1 = deque([0]*100)
ax = plt.axes(xlim=(0, 50), ylim=(0, 10))
d = random_gen()

line, = plt.plot(a1)
plt.ion()
plt.ylim([0,50])
plt.show()

for i in range(0,200):
    a1.appendleft(next(d))
    datatoplot = a1.pop()
    line.set_ydata(a1)
    plt.draw()
    print a1[0]
    i += 1
    time.sleep(0.1)
    plt.pause(0.0001)
ser.close()
