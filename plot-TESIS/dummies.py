import sys
from PyQt4 import QtGui

from matplotlib.backends.backend_qt4agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.backends.backend_qt4agg import NavigationToolbar2QTAgg as NavigationToolbar
import matplotlib.pyplot as plt
import time
from collections import deque
import numpy as np
import sys, serial
from pylab import pause
ser = serial.Serial('/dev/ttyUSB0', 9600, timeout=1)#timeout=0, rtscts=1)
archivo = open("datos.txt", "w")
from random import randrange

class Window(QtGui.QDialog):
    def __init__(self, parent=None):
        super(Window, self).__init__(parent)

        # a figure instance to plot on
        self.figure = plt.figure()

        # this is the Canvas Widget that displays the `figure`
        # it takes the `figure` instance as a parameter to __init__
        self.canvas = FigureCanvas(self.figure)

        # this is the Navigation widget
        # it takes the Canvas widget and a parent
        self.toolbar = NavigationToolbar(self.canvas, self)

        # Just some button connected to `plot` method
        self.button = QtGui.QPushButton('Plot')
        self.button.setCheckable(True)
        self.button.clicked.connect(self.plot)
 
        # set the layout
        layout = QtGui.QVBoxLayout()
        layout.addWidget(self.toolbar)
        layout.addWidget(self.canvas)
        layout.addWidget(self.button)
        self.setLayout(layout)

    def plot(self):
        	#plot some random stuff
	#Acumulador
	a1 = deque([0]*100)
        # random data
        d = self.random_gen()

        # create an axis
        ax = self.figure.add_subplot(111)
        #ax.axes(xlim=(0, 50), ylim=(0, 10))
	#grafica continuamente
	ax.axis((0,100,0,10))
	line, = ax.plot(a1)
	i=0;
	#for i in range(0,200):
	while(1):
	    a1.appendleft(next(d))
	    datatoplot = a1.pop()
	    line.set_ydata(a1)
	    self.canvas.draw()
	    print a1[0]
	    i += 1
	    time.sleep(0.1)
	    pause(0.0001)
    def random_gen(self):
        while True:
            line = ser.readline()
            val = float(line)
            archivo.write(str(val)+'\n')
            yield val
            time.sleep(0.1)

''' 
    def plot(self):
        	#plot some random stuff
        # random data
        data = [random.random() for i in range(10)]

        # create an axis
        ax = self.figure.add_subplot(111)

        # discards the old graph
        ax.hold(False)

        # plot data
        ax.plot(data, '*-')

        # refresh canvas
        self.canvas.draw()
''' 

if __name__ == '__main__':
    app = QtGui.QApplication(sys.argv)

    main = Window()
    main.show()

    sys.exit(app.exec_())
