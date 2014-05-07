# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'Gplotter.ui'
#
# Created: Wed May  7 01:05:40 2014
#      by: PyQt4 UI code generator 4.10.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

class Ui_GpMainWindow(object):
    def setupUi(self, GpMainWindow):
        GpMainWindow.setObjectName(_fromUtf8("GpMainWindow"))
        GpMainWindow.resize(567, 497)
        self.Gpcentralwidget = QtGui.QWidget(GpMainWindow)
        self.Gpcentralwidget.setObjectName(_fromUtf8("Gpcentralwidget"))
        self.verticalLayout = QtGui.QVBoxLayout(self.Gpcentralwidget)
        self.verticalLayout.setObjectName(_fromUtf8("verticalLayout"))
        self.Mpl = MplWidget(self.Gpcentralwidget)
        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding, QtGui.QSizePolicy.Expanding)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.Mpl.sizePolicy().hasHeightForWidth())
        self.Mpl.setSizePolicy(sizePolicy)
        self.Mpl.setObjectName(_fromUtf8("Mpl"))
        self.verticalLayout.addWidget(self.Mpl)
        self.GpgridLayout = QtGui.QGridLayout()
        self.GpgridLayout.setObjectName(_fromUtf8("GpgridLayout"))
        self.pushButton = QtGui.QPushButton(self.Gpcentralwidget)
        self.pushButton.setObjectName(_fromUtf8("pushButton"))
        self.GpgridLayout.addWidget(self.pushButton, 0, 1, 1, 1)
        self.GppushButton = QtGui.QPushButton(self.Gpcentralwidget)
        self.GppushButton.setObjectName(_fromUtf8("GppushButton"))
        self.GpgridLayout.addWidget(self.GppushButton, 0, 0, 1, 1)
        self.pushButton_2 = QtGui.QPushButton(self.Gpcentralwidget)
        self.pushButton_2.setObjectName(_fromUtf8("pushButton_2"))
        self.GpgridLayout.addWidget(self.pushButton_2, 0, 2, 1, 1)
        self.verticalLayout.addLayout(self.GpgridLayout)
        GpMainWindow.setCentralWidget(self.Gpcentralwidget)

        self.retranslateUi(GpMainWindow)
        QtCore.QObject.connect(self.GppushButton, QtCore.SIGNAL(_fromUtf8("clicked()")), GpMainWindow.slot1)
        QtCore.QObject.connect(self.pushButton, QtCore.SIGNAL(_fromUtf8("clicked()")), GpMainWindow.slot1)
        QtCore.QObject.connect(self.pushButton_2, QtCore.SIGNAL(_fromUtf8("clicked()")), GpMainWindow.slot1)
        QtCore.QMetaObject.connectSlotsByName(GpMainWindow)

    def retranslateUi(self, GpMainWindow):
        GpMainWindow.setWindowTitle(_translate("GpMainWindow", "Graph Plotter", None))
        self.pushButton.setText(_translate("GpMainWindow", "Enfriar", None))
        self.GppushButton.setText(_translate("GpMainWindow", "StartPlot", None))
        self.pushButton_2.setText(_translate("GpMainWindow", "Calentar", None))

from mplwidget import MplWidget

if __name__ == "__main__":
    import sys
    app = QtGui.QApplication(sys.argv)
    GpMainWindow = QtGui.QMainWindow()
    ui = Ui_GpMainWindow()
    ui.setupUi(GpMainWindow)
    GpMainWindow.show()
    sys.exit(app.exec_())

