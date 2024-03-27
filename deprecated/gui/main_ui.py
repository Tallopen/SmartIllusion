from PyQt6.QtCore import *
from PyQt6.QtGui import *
from PyQt6.QtWidgets import *

from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure
import matplotlib.pyplot as plt

from datetime import datetime


class MyFigureCanvas(FigureCanvas):
    
    def __init__(self):
        self.fig = Figure()

        super(MyFigureCanvas, self).__init__(self.fig)
        self.ax = self.fig.add_subplot(1, 1, 1)


class TrackCanvas(FigureCanvas):

    patch_select = pyqtSignal(int, name="patch_select")
    patch_insert = pyqtSignal(int, name="patch_insert")
    patch_remove = pyqtSignal(int, name="patch_remove")

    def __init__(self):
        self.fig = Figure()

        super(TrackCanvas, self).__init__(self.fig)
        self.ax = self.fig.add_subplot(1, 1, 1)

        self._a = []
        self._b = []
        self._c = []
        self._d = []

        self.cid_press = self.fig.canvas.mpl_connect('button_press_event', self.on_press)
        # self.cid_release = self.fig.canvas.mpl_connect('button_release_event', self.on_release)

        self.selected_patch = None
        self.left = 0

        self.ylim = [-5, 5]

    def plot(self, _a, _b, _c, _d, left):
        self._a = _a
        self._b = _b
        self._c = _c
        self._d = _d
        self.left = left

        self._plot()

    def _plot(self):
        self.ax.clear()

        for n in range(self.left-1, self.left+7):
            left = max(n - 0.3, self.left-0.6)
            right = min(n + 0.3, self.left+6.6)

            if left < right:
                if n == self.selected_patch:
                    self.ax.axvspan(xmin=left, xmax=right, alpha=0.05, color='r')
                else:
                    self.ax.axvspan(xmin=left, xmax=right, alpha=0.05, color='k')

        if self._a is not None:
            self.ax.plot(list(range(len(self._a))), self._a, marker='o', c=[0.8, 0.2, 0.2], markersize=4, mfc=[0.8, 0.2, 0.2])
        if self._b is not None:
            self.ax.plot(list(range(len(self._b))), self._b, marker='o', c=[0.5, 0.5, 0.2], markersize=4, mfc=[0.5, 0.5, 0.2])
        if self._c is not None:
            self.ax.plot(list(range(len(self._c))), self._c, marker='o', c=[0.2, 0.5, 0.5], markersize=4, mfc=[0.2, 0.5, 0.5])
        if self._d is not None:
            self.ax.plot(list(range(len(self._d))), self._d, marker='o', c=[0.2, 0.2, 0.8], markersize=4, mfc=[0.2, 0.2, 0.8])

        self.ax.set_xlim(self.left - 0.6, self.left + 6.6)
        self.ax.set_ylim(self.ylim[0], self.ylim[1])
        self.draw_idle()

    def on_press(self, event):
        xdata, ydata = event.xdata, event.ydata
        if xdata is not None and ydata is not None:
            clicked_patch = int(xdata + 0.7)
            is_insert = (xdata + 0.7 - clicked_patch) < 0.4

            if event.button == 1:  # Left button press
                if is_insert:
                    self.patch_insert.emit(clicked_patch)
                else:
                    self.patch_select.emit(clicked_patch)

            elif event.button == 3:
                self.patch_remove.emit(clicked_patch)


class WeightCanvas(FigureCanvas):

    def __init__(self):
        self.fig = Figure()

        super(WeightCanvas, self).__init__(self.fig)
        self.ax = self.fig.add_subplot(1, 1, 1)

        self._x = []
        self._y = []

        self.selected_dot_id = None

    def plot(self, weight: list):
        _x = [_i[0] for _i in weight]
        _y = [_i[1] for _i in weight]

        self._x = _x
        self._y = _y

        self._plot()

    def _plot(self):
        self.ax.clear()

        if self._x is not None and self._y is not None:
            self.ax.plot(self._x, self._y, marker='o', c=[0.2, 0.2, 0.2], markersize=2, mfc=[0.2, 0.2, 0.2])
        if self.selected_dot_id is not None:
            self.ax.scatter(self._x[self.selected_dot_id], self._y[self.selected_dot_id], s=30, marker='o', color=[0.8, 0.2, 0.2])

        self.ax.set_xlim(-0.1, 1.1)
        self.ax.set_ylim(-0.1, 1.1)
        self.draw_idle()


class main_ui(object):
    def __init__(self, MainWindow):
        MainWindow.resize(1252, 700)
        MainWindow.setFocusPolicy(Qt.FocusPolicy.StrongFocus)
        self.actionNew_project = QAction(MainWindow)
        self.actionNew_project.setObjectName(u"actionNew_project")
        self.actionOpen_project = QAction(MainWindow)
        self.actionOpen_project.setObjectName(u"actionOpen_project")
        self.action_2 = QAction(MainWindow)
        self.action_2.setObjectName(u"action_2")
        self.actionClear_Recent_Projects = QAction(MainWindow)
        self.actionClear_Recent_Projects.setObjectName(u"actionClear_Recent_Projects")
        self.actionProject_Settings = QAction(MainWindow)
        self.actionProject_Settings.setObjectName(u"actionProject_Settings")
        self.actionSave_Project = QAction(MainWindow)
        self.actionSave_Project.setObjectName(u"actionSave_Project")
        self.actionClose_Project = QAction(MainWindow)
        self.actionClose_Project.setObjectName(u"actionClose_Project")
        self.actionExport_As_VR_Files = QAction(MainWindow)
        self.actionExport_As_VR_Files.setObjectName(u"actionExport_As_VR_Files")
        self.actionStart_a_New_Session = QAction(MainWindow)
        self.actionStart_a_New_Session.setObjectName(u"actionStart_a_New_Session")
        self.actionUndo = QAction(MainWindow)
        self.actionUndo.setObjectName(u"actionUndo")
        self.actionRedo = QAction(MainWindow)
        self.actionRedo.setObjectName(u"actionRedo")
        self.actionStart_a_new_Session = QAction(MainWindow)
        self.actionStart_a_new_Session.setObjectName(u"actionStart_a_new_Session")
        self.centralwidget = QWidget(MainWindow)
        self.centralwidget.setObjectName(u"centralwidget")
        self.horizontalLayout = QHBoxLayout(self.centralwidget)
        self.horizontalLayout.setObjectName(u"horizontalLayout")
        self.verticalLayout = QVBoxLayout()
        self.verticalLayout.setSpacing(0)
        self.verticalLayout.setObjectName(u"verticalLayout")
        self.VisionPanel = QGroupBox(self.centralwidget)
        self.VisionPanel.setObjectName(u"VisionPanel")
        self.VisionPanel.setMinimumSize(QSize(310, 0))
        self.VisionPanel.setMaximumSize(QSize(450, 16777215))
        self.gridLayout = QGridLayout(self.VisionPanel)
        self.gridLayout.setSpacing(2)
        self.gridLayout.setObjectName(u"gridLayout")
        self.Vab = MyFigureCanvas()
        self.Vab.setObjectName(u"Vab")

        self.gridLayout.addWidget(self.Vab, 0, 0, 1, 1)

        self.Vad = MyFigureCanvas()
        self.Vad.setObjectName(u"Vad")

        self.gridLayout.addWidget(self.Vad, 0, 2, 1, 1)

        self.Vac = MyFigureCanvas()
        self.Vac.setObjectName(u"Vac")

        self.gridLayout.addWidget(self.Vac, 0, 1, 1, 1)

        self.Vbc = MyFigureCanvas()
        self.Vbc.setObjectName(u"Vbc")

        self.gridLayout.addWidget(self.Vbc, 1, 0, 1, 1)

        self.Vbd = MyFigureCanvas()
        self.Vbd.setObjectName(u"Vbd")

        self.gridLayout.addWidget(self.Vbd, 1, 1, 1, 1)

        self.Vcd = MyFigureCanvas()
        self.Vcd.setObjectName(u"Vcd")

        self.gridLayout.addWidget(self.Vcd, 1, 2, 1, 1)

        self.verticalLayout.addWidget(self.VisionPanel)

        self.AudioPanel = QGroupBox(self.centralwidget)
        self.AudioPanel.setObjectName(u"AudioPanel")
        self.AudioPanel.setMinimumSize(QSize(310, 0))
        self.AudioPanel.setMaximumSize(QSize(450, 16777215))
        self.gridLayout_2 = QGridLayout(self.AudioPanel)
        self.gridLayout_2.setSpacing(2)
        self.gridLayout_2.setObjectName(u"gridLayout_2")
        self.Aac = MyFigureCanvas()
        self.Aac.setObjectName(u"Aac")

        self.gridLayout_2.addWidget(self.Aac, 0, 1, 1, 1)

        self.Aab = MyFigureCanvas()
        self.Aab.setObjectName(u"Aab")

        self.gridLayout_2.addWidget(self.Aab, 0, 0, 1, 1)

        self.Aad = MyFigureCanvas()
        self.Aad.setObjectName(u"Aad")

        self.gridLayout_2.addWidget(self.Aad, 0, 2, 1, 1)

        self.Abc = MyFigureCanvas()
        self.Abc.setObjectName(u"Abc")

        self.gridLayout_2.addWidget(self.Abc, 1, 0, 1, 1)

        self.Abd = MyFigureCanvas()
        self.Abd.setObjectName(u"Abd")

        self.gridLayout_2.addWidget(self.Abd, 1, 1, 1, 1)

        self.Acd = MyFigureCanvas()
        self.Acd.setObjectName(u"Acd")

        self.gridLayout_2.addWidget(self.Acd, 1, 2, 1, 1)

        self.verticalLayout.addWidget(self.AudioPanel)

        self.OdorPanel = QGroupBox(self.centralwidget)
        self.OdorPanel.setObjectName(u"OdorPanel")
        self.OdorPanel.setMinimumSize(QSize(310, 0))
        self.OdorPanel.setMaximumSize(QSize(450, 16777215))
        self.gridLayout_3 = QGridLayout(self.OdorPanel)
        self.gridLayout_3.setSpacing(2)
        self.gridLayout_3.setObjectName(u"gridLayout_3")
        self.Oac = MyFigureCanvas()
        self.Oac.setObjectName(u"Oac")

        self.gridLayout_3.addWidget(self.Oac, 0, 1, 1, 1)

        self.Obc = MyFigureCanvas()
        self.Obc.setObjectName(u"Obc")

        self.gridLayout_3.addWidget(self.Obc, 1, 0, 1, 1)

        self.Oab = MyFigureCanvas()
        self.Oab.setObjectName(u"Oab")

        self.gridLayout_3.addWidget(self.Oab, 0, 0, 1, 1)

        self.Oad = MyFigureCanvas()
        self.Oad.setObjectName(u"Oad")

        self.gridLayout_3.addWidget(self.Oad, 0, 2, 1, 1)

        self.Obd = MyFigureCanvas()
        self.Obd.setObjectName(u"Obd")

        self.gridLayout_3.addWidget(self.Obd, 1, 1, 1, 1)

        self.Ocd = MyFigureCanvas()
        self.Ocd.setObjectName(u"Ocd")

        self.gridLayout_3.addWidget(self.Ocd, 1, 2, 1, 1)

        self.verticalLayout.addWidget(self.OdorPanel)

        self.horizontalLayout.addLayout(self.verticalLayout)

        self.EditorPanel = QGroupBox(self.centralwidget)
        self.EditorPanel.setObjectName(u"EditorPanel")
        self.EditorPanel.setMinimumSize(QSize(300, 0))
        self.EditorPanel.setMaximumSize(QSize(400, 16777215))
        self.verticalLayout_5 = QVBoxLayout(self.EditorPanel)
        self.verticalLayout_5.setSpacing(2)
        self.verticalLayout_5.setObjectName(u"verticalLayout_5")
        self.label_4 = QLabel(self.EditorPanel)
        self.label_4.setObjectName(u"label_4")

        self.verticalLayout_5.addWidget(self.label_4)

        self.horizontalLayout_7 = QHBoxLayout()
        self.horizontalLayout_7.setObjectName(u"horizontalLayout_7")
        self.label_5 = QLabel(self.EditorPanel)
        self.label_5.setObjectName(u"label_5")

        self.horizontalLayout_7.addWidget(self.label_5)

        self.dimACombo = QComboBox(self.EditorPanel)
        self.dimACombo.setObjectName(u"dimACombo")

        self.horizontalLayout_7.addWidget(self.dimACombo)

        self.label_6 = QLabel(self.EditorPanel)
        self.label_6.setObjectName(u"label_6")

        self.horizontalLayout_7.addWidget(self.label_6)

        self.dimBCombo = QComboBox(self.EditorPanel)
        self.dimBCombo.setObjectName(u"dimBCombo")

        self.horizontalLayout_7.addWidget(self.dimBCombo)

        self.label_7 = QLabel(self.EditorPanel)
        self.label_7.setObjectName(u"label_7")

        self.horizontalLayout_7.addWidget(self.label_7)

        self.dimCCombo = QComboBox(self.EditorPanel)
        self.dimCCombo.setObjectName(u"dimCCombo")

        self.horizontalLayout_7.addWidget(self.dimCCombo)

        self.label_8 = QLabel(self.EditorPanel)
        self.label_8.setObjectName(u"label_8")

        self.horizontalLayout_7.addWidget(self.label_8)

        self.dimDCombo = QComboBox(self.EditorPanel)
        self.dimDCombo.setObjectName(u"dimDCombo")

        self.horizontalLayout_7.addWidget(self.dimDCombo)

        self.verticalLayout_5.addLayout(self.horizontalLayout_7)

        self.label_9 = QLabel(self.EditorPanel)
        self.label_9.setObjectName(u"label_9")

        self.verticalLayout_5.addWidget(self.label_9)

        self.Vtrack = TrackCanvas()
        self.Vtrack.setObjectName(u"Vtrack")

        self.verticalLayout_5.addWidget(self.Vtrack)

        self.horizontalLayout_8 = QHBoxLayout()
        self.horizontalLayout_8.setObjectName(u"horizontalLayout_8")
        self.label_10 = QLabel(self.EditorPanel)
        self.label_10.setObjectName(u"label_10")

        self.horizontalLayout_8.addWidget(self.label_10)

        self.Va = QLineEdit(self.EditorPanel)
        self.Va.setObjectName(u"Va")

        self.horizontalLayout_8.addWidget(self.Va)

        self.label_11 = QLabel(self.EditorPanel)
        self.label_11.setObjectName(u"label_11")

        self.horizontalLayout_8.addWidget(self.label_11)

        self.Vb = QLineEdit(self.EditorPanel)
        self.Vb.setObjectName(u"Vb")

        self.horizontalLayout_8.addWidget(self.Vb)

        self.label_12 = QLabel(self.EditorPanel)
        self.label_12.setObjectName(u"label_12")

        self.horizontalLayout_8.addWidget(self.label_12)

        self.Vc = QLineEdit(self.EditorPanel)
        self.Vc.setObjectName(u"Vc")

        self.horizontalLayout_8.addWidget(self.Vc)

        self.label_13 = QLabel(self.EditorPanel)
        self.label_13.setObjectName(u"label_13")

        self.horizontalLayout_8.addWidget(self.label_13)

        self.Vd = QLineEdit(self.EditorPanel)
        self.Vd.setObjectName(u"Vd")

        self.horizontalLayout_8.addWidget(self.Vd)

        self.verticalLayout_5.addLayout(self.horizontalLayout_8)

        self.label_14 = QLabel(self.EditorPanel)
        self.label_14.setObjectName(u"label_14")

        self.verticalLayout_5.addWidget(self.label_14)

        self.Atrack = TrackCanvas()
        self.Atrack.setObjectName(u"Atrack")

        self.verticalLayout_5.addWidget(self.Atrack)

        self.horizontalLayout_9 = QHBoxLayout()
        self.horizontalLayout_9.setObjectName(u"horizontalLayout_9")
        self.label_16 = QLabel(self.EditorPanel)
        self.label_16.setObjectName(u"label_16")

        self.horizontalLayout_9.addWidget(self.label_16)

        self.Aa = QLineEdit(self.EditorPanel)
        self.Aa.setObjectName(u"Aa")

        self.horizontalLayout_9.addWidget(self.Aa)

        self.label_17 = QLabel(self.EditorPanel)
        self.label_17.setObjectName(u"label_17")

        self.horizontalLayout_9.addWidget(self.label_17)

        self.Ab = QLineEdit(self.EditorPanel)
        self.Ab.setObjectName(u"Ab")

        self.horizontalLayout_9.addWidget(self.Ab)

        self.label_18 = QLabel(self.EditorPanel)
        self.label_18.setObjectName(u"label_18")

        self.horizontalLayout_9.addWidget(self.label_18)

        self.Ac = QLineEdit(self.EditorPanel)
        self.Ac.setObjectName(u"Ac")

        self.horizontalLayout_9.addWidget(self.Ac)

        self.label_19 = QLabel(self.EditorPanel)
        self.label_19.setObjectName(u"label_19")

        self.horizontalLayout_9.addWidget(self.label_19)

        self.Ad = QLineEdit(self.EditorPanel)
        self.Ad.setObjectName(u"Ad")

        self.horizontalLayout_9.addWidget(self.Ad)

        self.verticalLayout_5.addLayout(self.horizontalLayout_9)

        self.label_15 = QLabel(self.EditorPanel)
        self.label_15.setObjectName(u"label_15")

        self.verticalLayout_5.addWidget(self.label_15)

        self.Otrack = TrackCanvas()
        self.Otrack.setObjectName(u"Otrack")

        self.verticalLayout_5.addWidget(self.Otrack)

        self.horizontalLayout_10 = QHBoxLayout()
        self.horizontalLayout_10.setObjectName(u"horizontalLayout_10")
        self.label_23 = QLabel(self.EditorPanel)
        self.label_23.setObjectName(u"label_23")

        self.horizontalLayout_10.addWidget(self.label_23)

        self.Oa = QLineEdit(self.EditorPanel)
        self.Oa.setObjectName(u"Oa")

        self.horizontalLayout_10.addWidget(self.Oa)

        self.label_20 = QLabel(self.EditorPanel)
        self.label_20.setObjectName(u"label_20")

        self.horizontalLayout_10.addWidget(self.label_20)

        self.Ob = QLineEdit(self.EditorPanel)
        self.Ob.setObjectName(u"Ob")

        self.horizontalLayout_10.addWidget(self.Ob)

        self.label_21 = QLabel(self.EditorPanel)
        self.label_21.setObjectName(u"label_21")

        self.horizontalLayout_10.addWidget(self.label_21)

        self.Oc = QLineEdit(self.EditorPanel)
        self.Oc.setObjectName(u"Oc")

        self.horizontalLayout_10.addWidget(self.Oc)

        self.label_22 = QLabel(self.EditorPanel)
        self.label_22.setObjectName(u"label_22")

        self.horizontalLayout_10.addWidget(self.label_22)

        self.Od = QLineEdit(self.EditorPanel)
        self.Od.setObjectName(u"Od")

        self.horizontalLayout_10.addWidget(self.Od)

        self.verticalLayout_5.addLayout(self.horizontalLayout_10)

        self.horizontalLayout.addWidget(self.EditorPanel)

        self.verticalLayout_6 = QVBoxLayout()
        self.verticalLayout_6.setObjectName(u"verticalLayout_6")
        self.TrackPanel = QGroupBox(self.centralwidget)
        self.TrackPanel.setObjectName(u"TrackPanel")
        self.verticalLayout_7 = QVBoxLayout(self.TrackPanel)
        self.verticalLayout_7.setSpacing(2)
        self.verticalLayout_7.setObjectName(u"verticalLayout_7")
        self.horizontalLayout_14 = QHBoxLayout()
        self.horizontalLayout_14.setObjectName(u"horizontalLayout_14")
        self.label_34 = QLabel(self.TrackPanel)
        self.label_34.setObjectName(u"label_34")

        self.horizontalLayout_14.addWidget(self.label_34)

        self.trackIIDSpin = QSpinBox(self.TrackPanel)
        self.trackIIDSpin.setObjectName(u"trackIIDSpin")

        self.horizontalLayout_14.addWidget(self.trackIIDSpin)

        self.verticalLayout_7.addLayout(self.horizontalLayout_14)

        self.RemoveTrackButton = QPushButton(self.TrackPanel)
        self.RemoveTrackButton.setObjectName(u"RemoveTrackButton")

        self.verticalLayout_7.addWidget(self.RemoveTrackButton)

        self.newTrackButton = QPushButton(self.TrackPanel)
        self.newTrackButton.setObjectName(u"newTrackButton")

        self.verticalLayout_7.addWidget(self.newTrackButton)

        self.verticalLayout_6.addWidget(self.TrackPanel)

        self.StrengthPanel = QGroupBox(self.centralwidget)
        self.StrengthPanel.setObjectName(u"StrengthPanel")
        self.StrengthPanel.setMinimumSize(QSize(300, 0))
        self.StrengthPanel.setMaximumSize(QSize(400, 16777215))
        self.verticalLayout_4 = QVBoxLayout(self.StrengthPanel)
        self.verticalLayout_4.setSpacing(2)
        self.verticalLayout_4.setObjectName(u"verticalLayout_4")
        self.horizontalLayout_5 = QHBoxLayout()
        self.horizontalLayout_5.setObjectName(u"horizontalLayout_5")
        self.label_3 = QLabel(self.StrengthPanel)
        self.label_3.setObjectName(u"label_3")

        self.horizontalLayout_5.addWidget(self.label_3)

        self.weightSpin = QSpinBox(self.StrengthPanel)
        self.weightSpin.setObjectName(u"weightSpin")

        self.horizontalLayout_5.addWidget(self.weightSpin)

        self.addWeightButton = QPushButton("Add...")
        self.removeWeightButton = QPushButton("Delete")
        self.horizontalLayout_5.addWidget(self.addWeightButton)
        self.horizontalLayout_5.addWidget(self.removeWeightButton)

        self.horizontalSpacer = QSpacerItem(40, 20, QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Minimum)

        self.horizontalLayout_5.addItem(self.horizontalSpacer)

        self.verticalLayout_4.addLayout(self.horizontalLayout_5)

        self.label_26 = QLabel(self.StrengthPanel)
        self.label_26.setObjectName(u"label_26")

        self.verticalLayout_4.addWidget(self.label_26)

        self.Vstrength = WeightCanvas()
        self.Vstrength.setObjectName(u"Vstrength")

        self.verticalLayout_4.addWidget(self.Vstrength)

        self.horizontalLayout_6 = QHBoxLayout()
        self.horizontalLayout_6.setObjectName(u"horizontalLayout_6")
        self.horizontalSpacer_2 = QSpacerItem(40, 20, QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Minimum)

        self.horizontalLayout_6.addItem(self.horizontalSpacer_2)

        self.label_24 = QLabel(self.StrengthPanel)
        self.label_24.setObjectName(u"label_24")

        self.horizontalLayout_6.addWidget(self.label_24)

        self.Vx = QLineEdit(self.StrengthPanel)
        self.Vx.setObjectName(u"Vx")
        self.Vx.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_6.addWidget(self.Vx)

        self.label_25 = QLabel(self.StrengthPanel)
        self.label_25.setObjectName(u"label_25")

        self.horizontalLayout_6.addWidget(self.label_25)

        self.Vy = QLineEdit(self.StrengthPanel)
        self.Vy.setObjectName(u"Vy")
        self.Vy.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_6.addWidget(self.Vy)

        self.verticalLayout_4.addLayout(self.horizontalLayout_6)

        self.label_28 = QLabel(self.StrengthPanel)
        self.label_28.setObjectName(u"label_28")

        self.verticalLayout_4.addWidget(self.label_28)

        self.Astrength = WeightCanvas()
        self.Astrength.setObjectName(u"Astrength")

        self.verticalLayout_4.addWidget(self.Astrength)

        self.horizontalLayout_12 = QHBoxLayout()
        self.horizontalLayout_12.setObjectName(u"horizontalLayout_12")
        self.horizontalSpacer_3 = QSpacerItem(40, 20, QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Minimum)

        self.horizontalLayout_12.addItem(self.horizontalSpacer_3)

        self.label_29 = QLabel(self.StrengthPanel)
        self.label_29.setObjectName(u"label_29")

        self.horizontalLayout_12.addWidget(self.label_29)

        self.Ax = QLineEdit(self.StrengthPanel)
        self.Ax.setObjectName(u"Ax")
        self.Ax.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_12.addWidget(self.Ax)

        self.label_32 = QLabel(self.StrengthPanel)
        self.label_32.setObjectName(u"label_32")

        self.horizontalLayout_12.addWidget(self.label_32)

        self.Ay = QLineEdit(self.StrengthPanel)
        self.Ay.setObjectName(u"Ay")
        self.Ay.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_12.addWidget(self.Ay)

        self.verticalLayout_4.addLayout(self.horizontalLayout_12)

        self.label_30 = QLabel(self.StrengthPanel)
        self.label_30.setObjectName(u"label_30")

        self.verticalLayout_4.addWidget(self.label_30)

        self.Ostrength = WeightCanvas()
        self.Ostrength.setObjectName(u"Ostrength")

        self.verticalLayout_4.addWidget(self.Ostrength)

        self.horizontalLayout_13 = QHBoxLayout()
        self.horizontalLayout_13.setObjectName(u"horizontalLayout_13")
        self.horizontalSpacer_4 = QSpacerItem(40, 20, QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Minimum)

        self.horizontalLayout_13.addItem(self.horizontalSpacer_4)

        self.label_31 = QLabel(self.StrengthPanel)
        self.label_31.setObjectName(u"label_31")

        self.horizontalLayout_13.addWidget(self.label_31)

        self.Ox = QLineEdit(self.StrengthPanel)
        self.Ox.setObjectName(u"Ox")
        self.Ox.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_13.addWidget(self.Ox)

        self.label_33 = QLabel(self.StrengthPanel)
        self.label_33.setObjectName(u"label_33")

        self.horizontalLayout_13.addWidget(self.label_33)

        self.Oy = QLineEdit(self.StrengthPanel)
        self.Oy.setObjectName(u"Oy")
        self.Oy.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_13.addWidget(self.Oy)

        self.verticalLayout_4.addLayout(self.horizontalLayout_13)

        self.verticalLayout_6.addWidget(self.StrengthPanel)

        self.horizontalLayout.addLayout(self.verticalLayout_6)

        self.verticalLayout_2 = QVBoxLayout()
        self.verticalLayout_2.setObjectName(u"verticalLayout_2")
        self.PreviewPanel = QGroupBox(self.centralwidget)
        self.PreviewPanel.setObjectName(u"PreviewPanel")
        self.PreviewPanel.setMinimumSize(QSize(300, 0))
        self.PreviewPanel.setMaximumSize(QSize(400, 16777215))
        self.verticalLayout_3 = QVBoxLayout(self.PreviewPanel)
        self.verticalLayout_3.setSpacing(2)
        self.verticalLayout_3.setObjectName(u"verticalLayout_3")
        self.previewEnableCheck = QCheckBox(self.PreviewPanel)
        self.previewEnableCheck.setObjectName(u"previewEnableCheck")

        self.verticalLayout_3.addWidget(self.previewEnableCheck)

        self.horizontalLayout_11 = QHBoxLayout()
        self.horizontalLayout_11.setObjectName(u"horizontalLayout_11")
        self.label_27 = QLabel(self.PreviewPanel)
        self.label_27.setObjectName(u"label_27")

        self.horizontalLayout_11.addWidget(self.label_27)

        self.virtualPositionSpin = QDoubleSpinBox(self.PreviewPanel)
        self.virtualPositionSpin.setObjectName(u"virtualPositionSpin")

        self.horizontalLayout_11.addWidget(self.virtualPositionSpin)

        self.verticalLayout_3.addLayout(self.horizontalLayout_11)

        self.virtualPositionSlider = QSlider(self.PreviewPanel)
        self.virtualPositionSlider.setObjectName(u"virtualPositionSlider")
        self.virtualPositionSlider.setOrientation(Qt.Orientation.Horizontal)

        self.verticalLayout_3.addWidget(self.virtualPositionSlider)

        self.previewGraphics = MyFigureCanvas()
        self.previewGraphics.setObjectName(u"previewGraphics")
        self.previewGraphics.setMaximumSize(QSize(16777215, 200))

        self.verticalLayout_3.addWidget(self.previewGraphics)

        self.horizontalLayout_3 = QHBoxLayout()
        self.horizontalLayout_3.setObjectName(u"horizontalLayout_3")
        self.label = QLabel(self.PreviewPanel)
        self.label.setObjectName(u"label")

        self.horizontalLayout_3.addWidget(self.label)

        self.portCombo = QComboBox(self.PreviewPanel)
        self.portCombo.setObjectName(u"portCombo")

        self.horizontalLayout_3.addWidget(self.portCombo)

        self.scanButton = QPushButton(self.PreviewPanel)
        self.scanButton.setObjectName(u"scanButton")
        self.scanButton.setMaximumSize(QSize(60, 16777215))

        self.horizontalLayout_3.addWidget(self.scanButton)

        self.verticalLayout_3.addLayout(self.horizontalLayout_3)

        self.horizontalLayout_4 = QHBoxLayout()
        self.horizontalLayout_4.setObjectName(u"horizontalLayout_4")
        self.connectButton = QPushButton(self.PreviewPanel)
        self.connectButton.setObjectName(u"connectButton")

        self.horizontalLayout_4.addWidget(self.connectButton)

        self.disconnectButton = QPushButton(self.PreviewPanel)
        self.disconnectButton.setObjectName(u"disconnectButton")

        self.horizontalLayout_4.addWidget(self.disconnectButton)

        self.verticalLayout_3.addLayout(self.horizontalLayout_4)

        self.label_2 = QLabel(self.PreviewPanel)
        self.label_2.setObjectName(u"label_2")

        self.verticalLayout_3.addWidget(self.label_2)

        self.portMessages = QTextEdit(self.PreviewPanel)
        self.portMessages.setObjectName(u"portMessages")

        self.verticalLayout_3.addWidget(self.portMessages)

        self.verticalLayout_2.addWidget(self.PreviewPanel)

        self.horizontalLayout_2 = QHBoxLayout()
        self.horizontalLayout_2.setObjectName(u"horizontalLayout_2")

        self.verticalLayout_2.addLayout(self.horizontalLayout_2)

        self.horizontalLayout.addLayout(self.verticalLayout_2)

        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QMenuBar(MainWindow)
        self.menubar.setObjectName(u"menubar")
        self.menubar.setGeometry(QRect(0, 0, 1252, 21))
        self.menuProject = QMenu(self.menubar)
        self.menuProject.setObjectName(u"menuProject")
        self.menuOpen_Recent = QMenu(self.menuProject)
        self.menuOpen_Recent.setObjectName(u"menuOpen_Recent")
        self.menuOperation = QMenu(self.menubar)
        self.menuOperation.setObjectName(u"menuOperation")
        MainWindow.setMenuBar(self.menubar)

        self.menubar.addAction(self.menuProject.menuAction())
        self.menubar.addAction(self.menuOperation.menuAction())
        self.menuProject.addAction(self.actionNew_project)
        self.menuProject.addAction(self.actionOpen_project)
        self.menuProject.addAction(self.menuOpen_Recent.menuAction())
        self.menuProject.addAction(self.actionSave_Project)
        self.menuProject.addAction(self.actionClose_Project)
        self.menuProject.addSeparator()
        self.menuProject.addAction(self.actionProject_Settings)
        self.menuProject.addAction(self.actionExport_As_VR_Files)
        self.menuOpen_Recent.addAction(self.action_2)
        self.menuOpen_Recent.addSeparator()
        self.menuOpen_Recent.addAction(self.actionClear_Recent_Projects)
        self.menuOperation.addAction(self.actionUndo)
        self.menuOperation.addAction(self.actionRedo)
        self.menuOperation.addSeparator()
        self.menuOperation.addAction(self.actionStart_a_new_Session)

        self.dim_combo_set = [self.dimACombo, self.dimBCombo, self.dimCCombo, self.dimDCombo]

        self.latent_space_canvas = dict()
        self.latent_space_figures = dict()

        self.retranslateUi(MainWindow)
        self.add_plots()

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(QCoreApplication.translate("MainWindow", u"SmartIllusion", None))
        self.actionNew_project.setText(QCoreApplication.translate("MainWindow", u"New project...", None))
        self.actionOpen_project.setText(QCoreApplication.translate("MainWindow", u"Open project...", None))
        self.action_2.setText(QCoreApplication.translate("MainWindow", u"*", None))
        self.actionClear_Recent_Projects.setText(QCoreApplication.translate("MainWindow", u"Clear Recent Projects", None))
        self.actionProject_Settings.setText(QCoreApplication.translate("MainWindow", u"Project Settings", None))
        self.actionSave_Project.setText(QCoreApplication.translate("MainWindow", u"Save Project", None))
        self.actionClose_Project.setText(QCoreApplication.translate("MainWindow", u"Close Project", None))
        self.actionExport_As_VR_Files.setText(QCoreApplication.translate("MainWindow", u"Export As VR Files", None))
        self.actionStart_a_New_Session.setText(QCoreApplication.translate("MainWindow", u"Start a New Session", None))
        self.actionUndo.setText(QCoreApplication.translate("MainWindow", u"Undo", None))
        self.actionRedo.setText(QCoreApplication.translate("MainWindow", u"Redo", None))
        self.actionStart_a_new_Session.setText(QCoreApplication.translate("MainWindow", u"Start a new Session", None))
        self.VisionPanel.setTitle(QCoreApplication.translate("MainWindow", u"Vision", None))
        self.AudioPanel.setTitle(QCoreApplication.translate("MainWindow", u"Audio", None))
        self.OdorPanel.setTitle(QCoreApplication.translate("MainWindow", u"Odor", None))
        self.EditorPanel.setTitle(QCoreApplication.translate("MainWindow", u"Editor", None))
        self.label_4.setText(QCoreApplication.translate("MainWindow", u"Select Current Dimensions:", None))
        self.label_5.setText(QCoreApplication.translate("MainWindow", u"A:", None))
        self.label_6.setText(QCoreApplication.translate("MainWindow", u"B:", None))
        self.label_7.setText(QCoreApplication.translate("MainWindow", u"C:", None))
        self.label_8.setText(QCoreApplication.translate("MainWindow", u"D:", None))
        self.label_9.setText(QCoreApplication.translate("MainWindow", u"Vision:", None))
        self.label_10.setText(QCoreApplication.translate("MainWindow", u"A:", None))
        self.label_11.setText(QCoreApplication.translate("MainWindow", u"B:", None))
        self.label_12.setText(QCoreApplication.translate("MainWindow", u"C:", None))
        self.label_13.setText(QCoreApplication.translate("MainWindow", u"D:", None))
        self.label_14.setText(QCoreApplication.translate("MainWindow", u"Audio:", None))
        self.label_16.setText(QCoreApplication.translate("MainWindow", u"A:", None))
        self.label_17.setText(QCoreApplication.translate("MainWindow", u"B:", None))
        self.label_18.setText(QCoreApplication.translate("MainWindow", u"C:", None))
        self.label_19.setText(QCoreApplication.translate("MainWindow", u"D:", None))
        self.label_15.setText(QCoreApplication.translate("MainWindow", u"Odor:", None))
        self.label_23.setText(QCoreApplication.translate("MainWindow", u"A:", None))
        self.label_20.setText(QCoreApplication.translate("MainWindow", u"B:", None))
        self.label_21.setText(QCoreApplication.translate("MainWindow", u"C:", None))
        self.label_22.setText(QCoreApplication.translate("MainWindow", u"D:", None))
        self.TrackPanel.setTitle(QCoreApplication.translate("MainWindow", u"Tracks", None))
        self.label_34.setText(QCoreApplication.translate("MainWindow", u"Edit Track ID: ", None))
        self.RemoveTrackButton.setText(QCoreApplication.translate("MainWindow", u"Remove Current Track", None))
        self.newTrackButton.setText(QCoreApplication.translate("MainWindow", u"Add New Tracks", None))
        self.StrengthPanel.setTitle(QCoreApplication.translate("MainWindow", u"Stimuli Strength", None))
        self.label_3.setText(QCoreApplication.translate("MainWindow", u"Weight: ", None))
        self.label_26.setText(QCoreApplication.translate("MainWindow", u"Vision:", None))
        self.label_24.setText(QCoreApplication.translate("MainWindow", u"X:", None))
        self.label_25.setText(QCoreApplication.translate("MainWindow", u"Y:", None))
        self.label_28.setText(QCoreApplication.translate("MainWindow", u"Audio:", None))
        self.label_29.setText(QCoreApplication.translate("MainWindow", u"X:", None))
        self.label_32.setText(QCoreApplication.translate("MainWindow", u"Y:", None))
        self.label_30.setText(QCoreApplication.translate("MainWindow", u"Odor:", None))
        self.label_31.setText(QCoreApplication.translate("MainWindow", u"X:", None))
        self.label_33.setText(QCoreApplication.translate("MainWindow", u"Y:", None))
        self.PreviewPanel.setTitle(QCoreApplication.translate("MainWindow", u"Preview", None))
        self.previewEnableCheck.setText(QCoreApplication.translate("MainWindow", u"Enable This", None))
        self.label_27.setText(QCoreApplication.translate("MainWindow", u"Virtual Position:", None))
        self.label.setText(QCoreApplication.translate("MainWindow", u"Odor Port: ", None))
        self.scanButton.setText(QCoreApplication.translate("MainWindow", u"Scan", None))
        self.connectButton.setText(QCoreApplication.translate("MainWindow", u"Connect", None))
        self.disconnectButton.setText(QCoreApplication.translate("MainWindow", u"Disconnect", None))
        self.label_2.setText(QCoreApplication.translate("MainWindow", u"Messages:", None))
        self.menuProject.setTitle(QCoreApplication.translate("MainWindow", u"Project", None))
        self.menuOpen_Recent.setTitle(QCoreApplication.translate("MainWindow", u"Open Recent", None))
        self.menuOperation.setTitle(QCoreApplication.translate("MainWindow", u"Operation", None))

    def add_plots(self):
        self.latent_space_canvas["v"] = [self.Vab, self.Vac, self.Vad, self.Vbc, self.Vbd, self.Vcd]
        self.latent_space_canvas["a"] = [self.Aab, self.Aac, self.Aad, self.Abc, self.Abd, self.Acd]
        self.latent_space_canvas["o"] = [self.Oab, self.Oac, self.Oad, self.Obc, self.Obd, self.Ocd]

        self.track_canvas = {
            "v": self.Vtrack,
            "a": self.Atrack,
            "o": self.Otrack
        }

        self.weight_canvas = {
            "v": self.Vstrength,
            "a": self.Astrength,
            "o": self.Ostrength
        }

    def scatter_latent_space(self, latent_space, dimensions, tracks=None, highlight_track_id=None, modality='v'):
        axis_label = ['A', 'B', 'C', 'D']
        handle_id = 0
        for dim1 in range(3):
            for dim2 in range(dim1+1, 4):
                self.latent_space_canvas[modality][handle_id].ax.clear()
                if latent_space is not None and dimensions[dim1] and dimensions[dim2]:
                    latent_size = round(latent_space.latent.shape[0] / 1000)+1
                    self.latent_space_canvas[modality][handle_id].ax.scatter(latent_space.latent[::latent_size, dimensions[dim1]-1], latent_space.latent[::latent_size, dimensions[dim2]-1], 0.1, latent_space.physics[::latent_size, 0], cmap="rainbow")
                    self.latent_space_canvas[modality][handle_id].ax.set_xlabel(axis_label[dim1])
                    self.latent_space_canvas[modality][handle_id].ax.set_ylabel(axis_label[dim2])

                    for track_id, track in enumerate(tracks):
                        _t = {
                            "v": track.visual_pts,
                            "a": track.audio_pts,
                            "o": track.odor_pts
                        }[modality]
                        _x = [_p[dimensions[dim1]-1] for _p in _t]
                        _y = [_p[dimensions[dim2]-1] for _p in _t]

                        if track_id == highlight_track_id:
                            self.latent_space_canvas[modality][handle_id].ax.plot(_x, _y, c='g', lw=1, marker='o', mfc='g', ms=1.25)
                        else:
                            self.latent_space_canvas[modality][handle_id].ax.plot(_x, _y, c='k', lw=0.5)

                self.latent_space_canvas[modality][handle_id].draw_idle()
                handle_id += 1

    def plot_latent_tracks(self, track=None, dims=(0, 0, 0, 0), left=0, modality="v"):
        track_panel = self.track_canvas[modality]
        track_panel.ax.clear()

        if track is not None:
            pts = {
                "v": track.visual_pts,
                "a": track.audio_pts,
                "o": track.odor_pts
            }[modality]

            _a = [_i[dims[0]-1] for _i in pts] if dims[0] else None
            _b = [_i[dims[1]-1] for _i in pts] if dims[1] else None
            _c = [_i[dims[2]-1] for _i in pts] if dims[2] else None
            _d = [_i[dims[3]-1] for _i in pts] if dims[3] else None

            track_panel.plot(_a, _b, _c, _d, left)
        else:
            track_panel.draw_idle()

    def plot_weight(self, track=None, comb_id=None, modality="v"):
        weight_panel = self.weight_canvas[modality]
        weight_panel.ax.clear()

        if track is not None and comb_id is not None:
            weight_panel.plot(track.comb_mod[modality][comb_id])
        else:
            weight_panel.draw_idle()

    def print(self, message):
        self.portMessages.append("[" + datetime.now().strftime("%H:%M:%S") + "] " + message)

    def toggle_vision_enabled(self, enable_state):
        self.Va.setEnabled(enable_state)
        self.Vb.setEnabled(enable_state)
        self.Vc.setEnabled(enable_state)
        self.Vd.setEnabled(enable_state)
        self.Vx.setEnabled(enable_state)
        self.Vy.setEnabled(enable_state)

    def toggle_odor_enabled(self, enable_state):
        self.Oa.setEnabled(enable_state)
        self.Ob.setEnabled(enable_state)
        self.Oc.setEnabled(enable_state)
        self.Od.setEnabled(enable_state)
        self.Ox.setEnabled(enable_state)
        self.Oy.setEnabled(enable_state)

    def toggle_audio_enabled(self, enable_state):
        self.Aa.setEnabled(enable_state)
        self.Ab.setEnabled(enable_state)
        self.Ac.setEnabled(enable_state)
        self.Ad.setEnabled(enable_state)
        self.Ax.setEnabled(enable_state)
        self.Ay.setEnabled(enable_state)

    def toggle_preview_enabled(self, enable_state):
        self.virtualPositionSlider.setEnabled(enable_state)
        self.virtualPositionSpin.setEnabled(enable_state)
        self.portCombo.setEnabled(enable_state)
        self.scanButton.setEnabled(enable_state)
        self.connectButton.setEnabled(enable_state)
        self.disconnectButton.setEnabled(enable_state)
        self.portMessages.setEnabled(enable_state)

    def toggle_project_editing(self, enable_state):
        self.actionSave_Project.setEnabled(enable_state)
        self.actionClose_Project.setEnabled(enable_state)
        self.actionProject_Settings.setEnabled(enable_state)
        self.actionExport_As_VR_Files.setEnabled(enable_state)
        self.TrackPanel.setEnabled(enable_state)
        self.PreviewPanel.setEnabled(enable_state)
        self.EditorPanel.setEnabled(enable_state)
        self.StrengthPanel.setEnabled(enable_state)

    def set_vao_combo_dimension(self, dim, current_dim_abcd=(0, 0, 0, 0)):
        self.dimACombo.clear()
        self.dimBCombo.clear()
        self.dimCCombo.clear()
        self.dimDCombo.clear()

        _dim_list = ["None"]
        _dim_list.extend([str(i+1) for i in range(dim)])

        self.dimACombo.addItems(_dim_list)
        self.dimBCombo.addItems(_dim_list)
        self.dimCCombo.addItems(_dim_list)
        self.dimDCombo.addItems(_dim_list)

        self.dimACombo.setCurrentIndex(current_dim_abcd[0])
        self.dimBCombo.setCurrentIndex(current_dim_abcd[1])
        self.dimCCombo.setCurrentIndex(current_dim_abcd[2])
        self.dimDCombo.setCurrentIndex(current_dim_abcd[3])

