import sys
from PyQt6.QtWidgets import QApplication, QSplashScreen
from PyQt6.QtGui import QPixmap
from gui.guiMain import GUIMain


if __name__ == '__main__':

    app = QApplication([])

    splash = QSplashScreen(QPixmap("gui/ico/splash.png"))
    splash.show()

    ex = GUIMain()
    splash.finish(ex)
    splash.deleteLater()
    ex.show()

    sys.exit(app.exec())
