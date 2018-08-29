import sys
from PyQt5 import QtWidgets, QtGui
from QHexEdit import QHexEdit, QHexEditData

if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)

    # QHexEditData* hexeditdata = QHexEditData::fromFile("test.py");
    hexeditdata = QHexEditData.fromFile('test.py')

    # QHexEdit* hexedit = new QHexEdit();
    # hexedit->setData(hexeditdata);
    hexedit = QHexEdit()
    hexedit.setData(hexeditdata)

    hexedit.show()

    # hexedit->commentRange(0, 12, "I'm a comment!");
    hexedit.commentRange(0, 12, "I'm a comment!")

    # hexedit->highlightBackground(0, 10, QColor(Qt::Red));
    hexedit.highlightBackground(0, 10, QtGui.QColor(255, 0, 0))

    sys.exit(app.exec_())
