from PyQt6.QtCore import *
from PyQt6.QtGui import *
from PyQt6.QtWidgets import *

from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure

import tensorflow as tf
import tensorflow.keras as keras
import numpy as np
import matplotlib.pyplot as plt
import math

import pickle

from collections import Counter

import scipy.io as scio
from scipy.interpolate import LinearNDInterpolator, NearestNDInterpolator
import os

import cv2

import re

import socket

# note: you may want to check network configuration of your computer to ensure your local ip
# use cmd -> ipconfig/all
LOCAL_IP = "127.0.0.1"

POSITION_UDP = 4515
REWARD_UDP = 4516


def find_numeric_mp4_files(path):

    pattern = re.compile(r'^\d+\.mp4$')
    numeric_mp4_files = []
    for root, dirs, files in os.walk(path):
        for file in files:
            if pattern.match(file):
                numeric_mp4_files.append(os.path.join(root, file))

    return numeric_mp4_files


os.environ["CUDA_VISIBLE_DEVICES"]="-1"


EPSI = 100
VIDEO_SAMPLE_RATE = 1


class InstructionThread(QThread):
    instruction_received = pyqtSignal(str)

    def __init__(self):
        super(InstructionThread, self).__init__()

        self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.client_socket.bind((LOCAL_IP, 4517))
        self.client_socket.settimeout(1)

        self.running = True

    def run(self):
        while self.running:
            try:
                _bytes = self.client_socket.recv(1024)
                message = _bytes.decode(encoding="utf8")
                self.instruction_received.emit(message)
            except:
                pass

    def stop(self):
        self.running = False
        self.client_socket.close()


class SpeedThread(QThread):
    speed_received = pyqtSignal(float)

    def __init__(self):
        super(SpeedThread, self).__init__()

        self.client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.client_socket.bind((LOCAL_IP, 4514))
        self.client_socket.settimeout(1)

        self.running = True

    def run(self):
        while self.running:
            try:
                _bytes = self.client_socket.recv(1024)
                message = _bytes.decode(encoding="utf8")
                _v = message.split(',')
                _v = math.sqrt(float(_v[0]) ** 2 + float(_v[1]) ** 2)
                self.speed_received.emit(_v)
            except:
                pass

    def stop(self):
        self.running = False
        self.client_socket.close()


class GUIMain(QMainWindow):

    advance = pyqtSignal(float)

    def __init__(self):
        super(GUIMain, self).__init__()

        # below is GUI construction, you won't read it
        self.resize(1050, 650)
        self.actionLoad = QAction(self)
        self.actionLoad.setObjectName(u"actionLoad")
        self.actionCreate_Tracks = QAction(self)
        self.actionCreate_Tracks.setObjectName(u"actionCreate_Tracks")
        self.centralwidget = QWidget(self)
        self.centralwidget.setObjectName(u"centralwidget")
        self.horizontalLayout_5 = QHBoxLayout(self.centralwidget)
        self.horizontalLayout_5.setObjectName(u"horizontalLayout_5")
        self.horizontalLayout_4 = QHBoxLayout()
        self.horizontalLayout_4.setObjectName(u"horizontalLayout_4")
        self.verticalLayout_2 = QVBoxLayout()
        self.verticalLayout_2.setObjectName(u"verticalLayout_2")
        self.groupBox = QGroupBox(self.centralwidget)
        self.groupBox.setObjectName(u"groupBox")
        self.verticalLayout = QVBoxLayout(self.groupBox)
        self.verticalLayout.setSpacing(3)
        self.verticalLayout.setObjectName(u"verticalLayout")
        self.verticalLayout.setContentsMargins(6, 6, 6, 6)
        self.horizontalLayout = QHBoxLayout()
        self.horizontalLayout.setObjectName(u"horizontalLayout")
        self.label = QLabel(self.groupBox)
        self.label.setObjectName(u"label")
        self.label.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout.addWidget(self.label)

        self.VAEPathLabel = QLabel(self.groupBox)
        self.VAEPathLabel.setObjectName(u"VAEPathLabel")
        sizePolicy = QSizePolicy(QSizePolicy.Policy.Preferred, QSizePolicy.Policy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.VAEPathLabel.sizePolicy().hasHeightForWidth())
        self.VAEPathLabel.setSizePolicy(sizePolicy)

        self.horizontalLayout.addWidget(self.VAEPathLabel)

        self.loadVAEButton = QPushButton(self.groupBox)
        self.loadVAEButton.setObjectName(u"loadVAEButton")
        self.loadVAEButton.setMaximumSize(QSize(100, 16777215))

        self.horizontalLayout.addWidget(self.loadVAEButton)

        self.verticalLayout.addLayout(self.horizontalLayout)

        self.horizontalLayout_2 = QHBoxLayout()
        self.horizontalLayout_2.setObjectName(u"horizontalLayout_2")
        self.label_3 = QLabel(self.groupBox)
        self.label_3.setObjectName(u"label_3")
        self.label_3.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_2.addWidget(self.label_3)

        self.UpscalerPathLabel = QLabel(self.groupBox)
        self.UpscalerPathLabel.setObjectName(u"UpscalerPathLabel")

        self.horizontalLayout_2.addWidget(self.UpscalerPathLabel)

        self.LoadUpscalerButton = QPushButton(self.groupBox)
        self.LoadUpscalerButton.setObjectName(u"LoadUpscalerButton")
        self.LoadUpscalerButton.setMaximumSize(QSize(100, 16777215))

        self.horizontalLayout_2.addWidget(self.LoadUpscalerButton)

        self.verticalLayout.addLayout(self.horizontalLayout_2)

        self.horizontalLayout_3 = QHBoxLayout()
        self.horizontalLayout_3.setObjectName(u"horizontalLayout_3")
        self.label_5 = QLabel(self.groupBox)
        self.label_5.setObjectName(u"label_5")
        self.label_5.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_3.addWidget(self.label_5)

        self.LVPathLabel = QLabel(self.groupBox)
        self.LVPathLabel.setObjectName(u"LVPathLabel")

        self.horizontalLayout_3.addWidget(self.LVPathLabel)

        self.LoadLVButton = QPushButton(self.groupBox)
        self.LoadLVButton.setObjectName(u"LoadLVButton")
        self.LoadLVButton.setMaximumSize(QSize(100, 16777215))

        self.horizontalLayout_3.addWidget(self.LoadLVButton)

        self.verticalLayout.addLayout(self.horizontalLayout_3)

        self.groupBox_3 = QGroupBox(self.groupBox)
        self.groupBox_3.setObjectName(u"groupBox_3")
        self.verticalLayout_4 = QVBoxLayout(self.groupBox_3)
        self.verticalLayout_4.setObjectName(u"verticalLayout_4")
        self.label_10 = QLabel(self.groupBox_3)
        self.label_10.setObjectName(u"label_10")

        self.verticalLayout_4.addWidget(self.label_10)

        self.PreviewView = FigureCanvas()

        self.verticalLayout_4.addWidget(self.PreviewView)

        self.verticalLayout.addWidget(self.groupBox_3)

        self.verticalLayout_2.addWidget(self.groupBox)

        self.horizontalLayout_4.addLayout(self.verticalLayout_2)

        self.groupBox_2 = QGroupBox(self.centralwidget)
        self.groupBox_2.setObjectName(u"groupBox_2")
        self.verticalLayout_3 = QVBoxLayout(self.groupBox_2)
        self.verticalLayout_3.setObjectName(u"verticalLayout_3")
        self.LatentView = FigureCanvas()
        self.LatentView.setObjectName(u"LatentView")

        self.verticalLayout_3.addWidget(self.LatentView)

        self.horizontalLayout_7 = QHBoxLayout()
        self.horizontalLayout_7.setObjectName(u"horizontalLayout_7")
        self.label_7 = QLabel(self.groupBox_2)
        self.label_7.setObjectName(u"label_7")

        self.horizontalLayout_7.addWidget(self.label_7)

        self.XDimCombo = QComboBox(self.groupBox_2)
        self.XDimCombo.addItem("")
        self.XDimCombo.addItem("")
        self.XDimCombo.setObjectName(u"XDimCombo")

        self.horizontalLayout_7.addWidget(self.XDimCombo)

        self.horizontalSpacer = QSpacerItem(20, 20, QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Minimum)

        self.horizontalLayout_7.addItem(self.horizontalSpacer)

        self.label_8 = QLabel(self.groupBox_2)
        self.label_8.setObjectName(u"label_8")

        self.horizontalLayout_7.addWidget(self.label_8)

        self.YDimCombo = QComboBox(self.groupBox_2)
        self.YDimCombo.addItem("")
        self.YDimCombo.addItem("")
        self.YDimCombo.setObjectName(u"YDimCombo")

        self.horizontalLayout_7.addWidget(self.YDimCombo)

        self.horizontalSpacer_2 = QSpacerItem(20, 20, QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Minimum)

        self.horizontalLayout_7.addItem(self.horizontalSpacer_2)

        self.label_9 = QLabel(self.groupBox_2)
        self.label_9.setObjectName(u"label_9")

        self.horizontalLayout_7.addWidget(self.label_9)

        self.TrackIDSpin = QSpinBox(self.groupBox_2)
        self.TrackIDSpin.setObjectName(u"TrackIDSpin")
        self.TrackIDSpin.setMinimum(0)
        self.TrackIDSpin.setValue(0)

        self.horizontalLayout_7.addWidget(self.TrackIDSpin)

        self.NewTrackButton = QPushButton(self.groupBox_2)
        self.NewTrackButton.setObjectName(u"NewTrackButton")

        self.horizontalLayout_7.addWidget(self.NewTrackButton)

        self.DeleteTrackButton = QPushButton(self.groupBox_2)
        self.DeleteTrackButton.setObjectName(u"DeleteTrackButton")

        self.horizontalLayout_7.addWidget(self.DeleteTrackButton)

        self.verticalLayout_3.addLayout(self.horizontalLayout_7)

        self.horizontalLayout_6 = QHBoxLayout()
        self.horizontalLayout_6.setObjectName(u"horizontalLayout_6")
        self.label_12 = QLabel(self.groupBox_2)
        self.label_12.setObjectName(u"label_12")
        sizePolicy1 = QSizePolicy(QSizePolicy.Policy.Minimum, QSizePolicy.Policy.Preferred)
        sizePolicy1.setHorizontalStretch(0)
        sizePolicy1.setVerticalStretch(0)
        sizePolicy1.setHeightForWidth(self.label_12.sizePolicy().hasHeightForWidth())
        self.label_12.setSizePolicy(sizePolicy1)
        self.label_12.setMinimumSize(QSize(20, 0))
        self.label_12.setMaximumSize(QSize(20, 16777215))

        self.horizontalLayout_6.addWidget(self.label_12)

        self.xLineEdit = QLineEdit(self.groupBox_2)
        self.xLineEdit.setObjectName(u"xLineEdit")
        self.xLineEdit.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_6.addWidget(self.xLineEdit)

        self.horizontalSpacer_4 = QSpacerItem(20, 20, QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Minimum)

        self.horizontalLayout_6.addItem(self.horizontalSpacer_4)

        self.label_13 = QLabel(self.groupBox_2)
        self.label_13.setObjectName(u"label_13")
        sizePolicy1.setHeightForWidth(self.label_13.sizePolicy().hasHeightForWidth())
        self.label_13.setSizePolicy(sizePolicy1)
        self.label_13.setMinimumSize(QSize(20, 0))
        self.label_13.setMaximumSize(QSize(20, 16777215))

        self.horizontalLayout_6.addWidget(self.label_13)

        self.yLineEdit = QLineEdit(self.groupBox_2)
        self.yLineEdit.setObjectName(u"yLineEdit")
        self.yLineEdit.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_6.addWidget(self.yLineEdit)

        self.horizontalSpacer_5 = QSpacerItem(20, 20, QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Minimum)

        self.horizontalLayout_6.addItem(self.horizontalSpacer_5)

        self.label_14 = QLabel(self.groupBox_2)
        self.label_14.setObjectName(u"label_14")

        self.horizontalLayout_6.addWidget(self.label_14)

        self.CurrentNodeSpin = QSpinBox(self.groupBox_2)
        self.CurrentNodeSpin.setObjectName(u"CurrentNodeSpin")

        self.horizontalLayout_6.addWidget(self.CurrentNodeSpin)

        self.NewNodeButton = QPushButton(self.groupBox_2)
        self.NewNodeButton.setObjectName(u"NewNodeButton")

        self.horizontalLayout_6.addWidget(self.NewNodeButton)

        self.DeleteNodeButton = QPushButton(self.groupBox_2)
        self.DeleteNodeButton.setObjectName(u"DeleteNodeButton")

        self.horizontalLayout_6.addWidget(self.DeleteNodeButton)

        self.verticalLayout_3.addLayout(self.horizontalLayout_6)

        self.TrackPreviewSlider = QSlider(self.groupBox_2)
        self.TrackPreviewSlider.setObjectName(u"TrackPreviewSlider")
        self.TrackPreviewSlider.setOrientation(Qt.Orientation.Horizontal)
        self.TrackPreviewSlider.setMaximum(10000)
        self.TrackPreviewSlider.setMinimum(0)
        self.TrackPreviewSlider.setSingleStep(1)

        self.verticalLayout_3.addWidget(self.TrackPreviewSlider)

        self.horizontalLayout_8 = QHBoxLayout()
        self.horizontalLayout_8.setObjectName(u"horizontalLayout_8")
        self.TrackPreviewPosition = QLabel(self.groupBox_2)
        self.TrackPreviewPosition.setObjectName(u"TrackPreviewPosition")
        sizePolicy1.setHeightForWidth(self.TrackPreviewPosition.sizePolicy().hasHeightForWidth())
        self.TrackPreviewPosition.setSizePolicy(sizePolicy1)
        self.TrackPreviewPosition.setMinimumSize(QSize(50, 0))

        self.horizontalLayout_8.addWidget(self.TrackPreviewPosition)

        self.horizontalSpacer_3 = QSpacerItem(40, 20, QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Minimum)

        self.horizontalLayout_8.addItem(self.horizontalSpacer_3)

        self.LoadProjectButton = QPushButton(self.groupBox_2)
        self.LoadProjectButton.setObjectName(u"LoadProjectButton")

        self.horizontalLayout_8.addWidget(self.LoadProjectButton)

        self.SaveProjectButton = QPushButton(self.groupBox_2)
        self.SaveProjectButton.setObjectName(u"SaveProjectButton")

        self.horizontalLayout_8.addWidget(self.SaveProjectButton)

        self.ExportVideoButton = QPushButton(self.groupBox_2)
        self.ExportVideoButton.setObjectName(u"ExportVideoButton")

        self.horizontalLayout_8.addWidget(self.ExportVideoButton)

        self.PlayVRButton = QPushButton(self.groupBox_2)
        self.PlayVRButton.setObjectName(u"PlayVRButton")

        self.horizontalLayout_8.addWidget(self.PlayVRButton)

        self.TerminateVRButton = QPushButton(self.groupBox_2)
        self.TerminateVRButton.setObjectName(u"TerminateVRButton")

        self.horizontalLayout_8.addWidget(self.TerminateVRButton)

        self.verticalLayout_3.addLayout(self.horizontalLayout_8)

        self.horizontalLayout_4.addWidget(self.groupBox_2)

        self.horizontalLayout_5.addLayout(self.horizontalLayout_4)

        self.setCentralWidget(self.centralwidget)
        self.menubar = QMenuBar(self)
        self.menubar.setObjectName(u"menubar")
        self.menubar.setGeometry(QRect(0, 0, 1050, 21))
        self.setMenuBar(self.menubar)

        self.YDimCombo.setCurrentIndex(1)

        self.setWindowTitle(u"Smart Illusion - Latent Space Navigator")
        self.actionLoad.setText(u"Load")
        self.actionCreate_Tracks.setText(u"Create Tracks")
        self.groupBox.setTitle(u"Models")
        self.label.setText(u"VAE: ")
        self.VAEPathLabel.setText(u"(None)")
        self.loadVAEButton.setText(u"Load...")
        self.label_3.setText(u"Upscaler:")
        self.UpscalerPathLabel.setText(u"(None)")
        self.LoadUpscalerButton.setText(u"Load...")
        self.label_5.setText(u"LVs: ")
        self.LVPathLabel.setText(u"(None)")
        self.LoadLVButton.setText(u"Load...")
        self.groupBox_3.setTitle(u"Preview")
        self.label_10.setText(u"Current Image Size: 256*784")
        self.groupBox_2.setTitle(u"Latent Editor")
        self.label_7.setText(u"X dim: ")
        self.XDimCombo.setItemText(0, u"0")
        self.XDimCombo.setItemText(1, u"1")

        self.label_8.setText(u"Y dim: ")
        self.YDimCombo.setItemText(0, u"0")
        self.YDimCombo.setItemText(1, u"1")

        self.label_9.setText(u"Track Under Edit: ")
        self.NewTrackButton.setText(u"New Track")
        self.DeleteTrackButton.setText(u"Delete Track")
        self.label_12.setText(u"X: ")
        self.label_13.setText(u"Y: ")
        self.label_14.setText(u"Current Node: ")
        self.NewNodeButton.setText(u"New Node")
        self.DeleteNodeButton.setText(u"Delete Node")
        self.TrackPreviewPosition.setText(u"0")
        self.LoadProjectButton.setText(u"Load")
        self.SaveProjectButton.setText(u"Save")
        self.ExportVideoButton.setText(u"Export Video")
        self.PlayVRButton.setText(u"Play")
        self.TerminateVRButton.setText(u"Terminate")
        # construction end

        self.vae = None
        self.vae_path = ""

        self.upscaler = None
        self.upscaler_path = ""

        self.latent = None
        self.physics = None

        self.loadVAEButton.clicked.connect(self.load_model_vae)
        self.LoadUpscalerButton.clicked.connect(self.load_model_upscaler)
        self.LoadLVButton.clicked.connect(self.load_latent_variables)

        self.XDimCombo.currentIndexChanged.connect(self.update_dimension)
        self.YDimCombo.currentIndexChanged.connect(self.update_dimension)

        self.LatentView.figure = Figure()
        self.ax = self.LatentView.figure.add_subplot(111)

        self.freeze_figure = False

        self.PreviewView.figure = Figure()
        self.PreviewAX = self.PreviewView.figure.add_subplot(111)

        self.project = Project()

        self.current_track = 0
        self.current_point = 0

        self.NewTrackButton.clicked.connect(self.new_track)
        self.NewNodeButton.clicked.connect(self.new_point)
        self.xLineEdit.textEdited.connect(self.move_point_xdim)
        self.yLineEdit.textEdited.connect(self.move_point_ydim)
        self.CurrentNodeSpin.valueChanged.connect(self.change_current_point)
        self.TrackIDSpin.valueChanged.connect(self.change_current_track)

        self.DeleteNodeButton.clicked.connect(self.delete_node)
        self.DeleteTrackButton.clicked.connect(self.delete_track)

        self.LoadProjectButton.clicked.connect(self.load)
        self.SaveProjectButton.clicked.connect(self.save)

        self.ExportVideoButton.clicked.connect(self.generate_video)

        self.TrackPreviewSlider.valueChanged.connect(self.update_latent_scene)

        self.nndi = None
        self.lndi = None

        self.lp = None

        self.tracks = []

        self.nav_window = None

        black_image = np.zeros((256, 768, 3), dtype=np.uint8)
        q_image = QImage(black_image.data, black_image.shape[1], black_image.shape[0], black_image.strides[0], QImage.Format.Format_RGB888)
        self.blank_img = QPixmap.fromImage(q_image)

        self.nav_displayer = None

        self.initialize_player()

        self.instruction_thread = None
        self.speed_thread = None

        self.running_track = None
        self.running_pos = 0

        self.client_socket_p = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.position_socket = (LOCAL_IP, POSITION_UDP)
        self.client_socket_r = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.reward_socket = (LOCAL_IP, REWARD_UDP)

        self.PlayVRButton.clicked.connect(self.run_session)

    def construct_metric_interpolator(self):
        vr_id = self.physics[:, 0]

        _c = Counter(vr_id)

        _d = []
        _l = []
        for _id in _c.keys():
            latent_p = self.latent[vr_id == _id, :]
            vr_p = self.physics[vr_id == _id, 1]

            for p_id in range(vr_p.shape[0]-1):
                _d.append((vr_p[p_id+1] - vr_p[p_id]) / np.sqrt(np.sum((latent_p[p_id, :] - latent_p[p_id+1, :])**2)))
                _l.append((latent_p[p_id, :] + latent_p[p_id+1, :]) / 2)

        self.nndi = NearestNDInterpolator(_l, _d)
        self.lndi = LinearNDInterpolator(_l, _d)

    def get_metric(self, args):
        lni = self.lndi(*args)
        if lni == np.nan:
            return self.nndi(*args)
        return lni

    def initialize_player(self):
        self.nav_window = QWidget()

        self.nav_displayer = QLabel()
        self.nav_displayer.setScaledContents(True)
        self.nav_displayer.setPixmap(self.blank_img)

        layout = QVBoxLayout()
        layout.addWidget(self.nav_displayer)
        layout.setSpacing(0)
        layout.setContentsMargins(0, 0, 0, 0)
        self.nav_window.setLayout(layout)

        screens = QApplication.screens()
        if len(screens) < 2:
            print("Error: Not enough screens")

        screen2 = screens[1]
        geometry = screen2.geometry()

        self.nav_window.move(geometry.left(), geometry.top())
        self.nav_window.showFullScreen()

    def run_session(self):
        self.load_videos()
        self.instruction_thread = InstructionThread()
        self.speed_thread = SpeedThread()

        self.speed_thread.speed_received.connect(self.speed_received)
        self.instruction_thread.instruction_received.connect(self.instruction_received)

        self.instruction_thread.start()
        self.speed_thread.start()

    def speed_received(self, speed):
        if self.running_track is not None:
            self.running_pos += speed * VIDEO_SAMPLE_RATE
            img_switch = max(0, int(self.running_pos / VIDEO_SAMPLE_RATE))

            if img_switch >= len(self.tracks[self.running_track].frames):
                self.nav_displayer.setPixmap(self.blank_img)
                self.running_pos = 0
                self.running_track = None
                self.client_socket_r.sendto("r1".encode(encoding="utf8"), self.reward_socket)
                # self.client_socket_p.sendto(f"0,{self.running_pos}".encode(encoding="utf8"), self.position_socket)
            else:
                current_img = self.tracks[self.running_track].frames[img_switch]
                q_image = QImage(current_img.data, current_img.shape[1], current_img.shape[0], current_img.strides[0], QImage.Format.Format_RGB888)
                self.nav_displayer.setPixmap(QPixmap(q_image))
                self.client_socket_p.sendto(f"0,{round(self.running_pos, 2)}".encode(encoding="utf8"), self.position_socket)

    def instruction_received(self, message):
        message = message.split(',')
        message_type = message[0]

        if message_type == "T":
            _tid = int(message[1])
            if _tid < len(self.tracks):
                self.running_pos = 0
                self.running_track = _tid

                current_img = self.tracks[self.running_track].frames[0]
                q_image = QImage(current_img.data, current_img.shape[1], current_img.shape[0], current_img.strides[0],
                                 QImage.Format.Format_RGB888)
                self.nav_displayer.setPixmap(QPixmap(q_image))

    @staticmethod
    def find_position(start_pt, end_pt, num_of_dissection, dissection_index):
        return tuple([start_pt[i]*(1-(dissection_index+1/2)/num_of_dissection) + end_pt[i]*(dissection_index+1/2)/num_of_dissection for i in range(len(start_pt))])

    def find_length(self, start_pt, end_pt):
        _l = np.sqrt(np.sum((np.array(end_pt) - np.array(start_pt))**2))
        _n = int(EPSI * _l) + 1
        _delta_s = _l / _n

        _length = 0
        for j in range(_n):
            _length += self.get_metric(self.find_position(start_pt, end_pt, _n, j)) * _delta_s

        return _length

    def get_track_length(self, track_id):
        track_length = 0
        if track_id < len(self.project.tracks) and len(self.project.tracks[track_id]) > 1:
            pt_num = len(self.project.tracks[track_id])
            for seg_id in range(pt_num-1):
                track_length += self.find_length(self.project.tracks[track_id][seg_id], self.project.tracks[track_id][seg_id+1])
        return track_length

    def find_latent_position_given_track_position(self, track_position, track_id):
        # track_position in [0,1]
        track_length = self.get_track_length(track_id)
        track_position = track_length * track_position
        self.TrackPreviewPosition.setText(str(round(track_position, 2)))

        track_length = 0
        seg_position = 0
        seg_id = 0
        if track_id < len(self.project.tracks) and len(self.project.tracks[track_id]) > 1:
            pt_num = len(self.project.tracks[track_id])
            pts = self.project.tracks[track_id]
            for seg_id in range(pt_num-1):
                acc_l = track_length + self.find_length(pts[seg_id], pts[seg_id+1])
                if acc_l > track_position:
                    seg_position = track_position - track_length
                    break
                track_length = acc_l

            start_pt = pts[seg_id]
            end_pt = pts[seg_id+1]

            _l = np.sqrt(np.sum((np.array(end_pt) - np.array(start_pt)) ** 2))
            _n = int(EPSI * _l) + 1
            _delta_s = _l / _n

            _length = 0
            for j in range(_n):
                latent_position = self.find_position(start_pt, end_pt, _n, j)
                _length += self.get_metric(latent_position) * _delta_s
                if seg_position <= _length:
                    return latent_position

            return None
        else:
            return None

    def estimate_latent_scene(self, lp):
        # lp: latent position
        if self.vae is not None and self.upscaler is not None and lp is not None:
            return self.upscaler.predict(self.vae.decoder(np.array([list(lp)]).astype('float16')))[0, :, :, :]
        return None

    def update_latent_scene(self):
        lp = self.find_latent_position_given_track_position(self.TrackPreviewSlider.value() / 10001, self.current_track)
        self.lp = lp
        img = self.estimate_latent_scene(lp)
        if img is not None:
            self.PreviewAX.clear()
            self.PreviewAX.imshow(img)
            self.PreviewView.draw_idle()
        self.update_figure()

    def save(self):
        returned_directory = QFileDialog.getSaveFileName(self, "Save Latent Tracks", "", "SmartIllusion Project File (*.sip)")
        if returned_directory[0] and returned_directory[0] is not None:
            self.project.save_project(returned_directory[0])

    def load(self):
        returned_directory = QFileDialog.getOpenFileName(self, "Load Latent Tracks", "", "SmartIllusion Project File (*.sip)")
        if returned_directory[0] and returned_directory[0] is not None:
            self.project.load_project(returned_directory[0])
            self.update_line_edit()
            self.update_latent_scene()

    def update_dimension(self):
        self.update_line_edit()
        self.update_figure()

    def load_model_vae(self):
        returned_directory = QFileDialog.getExistingDirectory(self, "Load VAE")
        try:
            if returned_directory and returned_directory is not None:
                self.vae_path = returned_directory
                self.vae = keras.models.load_model(self.vae_path)
                self.VAEPathLabel.setText(self.vae_path)
        except:
            QMessageBox.critical(self, "Model load error",
                                 "VAE model cannot be loaded.")

    def load_model_upscaler(self):
        returned_directory = QFileDialog.getExistingDirectory(self, "Load Upscaler")
        try:
            if returned_directory and returned_directory is not None:
                self.upscaler_path = returned_directory
                self.upscaler = keras.models.load_model(self.upscaler_path)
                self.UpscalerPathLabel.setText(self.upscaler_path)
        except:
            QMessageBox.critical(self, "Model load error", "Upscaler model cannot be loaded.")

    def load_latent_variables(self):
        returned_directory = QFileDialog.getOpenFileName(self, "Load Latent Embeddings")
        self.freeze_figure = True
        # try:
        if returned_directory[0] and returned_directory[0] is not None:
            latent_contents = scio.loadmat(returned_directory[0])
            self.latent = latent_contents['latent']
            self.physics = latent_contents['physics']
            self.LVPathLabel.setText(returned_directory[0])

            self.XDimCombo.clear()
            self.YDimCombo.clear()
            for varDim in range(self.latent.shape[1]):
                self.XDimCombo.addItem(str(varDim))
                self.YDimCombo.addItem(str(varDim))
            self.XDimCombo.setCurrentIndex(0)
            self.YDimCombo.setCurrentIndex(1)

            self.construct_metric_interpolator()

        # except:
        #     QMessageBox.critical(self, "LV load error",
        #                          "Wrong file.")
        self.freeze_figure = False
        self.update_latent_scene()

    def reveal_latent_variables(self, dimX, dimY):
        self.ax.scatter(self.latent[:, dimX], self.latent[:, dimY], 5, self.physics[:, 0])

    def reveal_tracks(self, dimX, dimY):
        for track_id, tracks in enumerate(self.project.tracks):
            if track_id == self.current_track:
                self.ax.scatter([pt[dimX] for pt in tracks], [pt[dimY] for pt in tracks], 10, 'r')
                self.ax.plot([pt[dimX] for pt in tracks], [pt[dimY] for pt in tracks], color='r', alpha=0.6)
                if self.lp is not None:
                    self.ax.scatter(self.lp[dimX], self.lp[dimY], 15, 'k')
            else:
                self.ax.plot([pt[dimX] for pt in tracks], [pt[dimY] for pt in tracks], color='r', alpha=0.2)

    def new_track(self):
        self.freeze_figure = True
        self.project.new_track()
        self.current_track = len(self.project.tracks)-1
        self.TrackIDSpin.setValue(self.current_track)
        self.new_point()

    def new_point(self):
        self.freeze_figure = True
        if len(self.project.tracks):
            self.project.add_point(self.current_track, [0 for _ in range(self.latent.shape[1])])
            self.current_point = len(self.project.tracks[self.current_track]) - 1
            self.CurrentNodeSpin.setValue(self.current_point)
            self.xLineEdit.setText("0")
            self.yLineEdit.setText("0")
            self.freeze_figure = False
            self.update_figure()

    def update_line_edit(self):
        if self.current_track < len(self.project.tracks) and self.current_point < len(self.project.tracks[self.current_track]):
            self.xLineEdit.setText(str(self.project.tracks[self.current_track][self.current_point][int(self.XDimCombo.currentText())]))
            self.yLineEdit.setText(str(self.project.tracks[self.current_track][self.current_point][int(self.YDimCombo.currentText())]))

    def delete_track(self):
        self.project.tracks.pop(self.current_track)
        self.update_line_edit()
        self.update_latent_scene()

    def delete_node(self):
        self.project.remove_point(self.current_track, self.current_point)
        self.update_line_edit()
        self.update_latent_scene()

    def move_point_xdim(self):
        try:
            self.project.tracks[self.current_track][self.current_point][int(self.XDimCombo.currentText())] = float(self.xLineEdit.text())
            self.update_latent_scene()
        except:
            pass

    def move_point_ydim(self):
        try:
            self.project.tracks[self.current_track][self.current_point][int(self.YDimCombo.currentText())] = float(self.yLineEdit.text())
            self.update_latent_scene()
        except:
            pass

    def change_current_track(self):
        self.current_track = self.TrackIDSpin.value()
        self.CurrentNodeSpin.setValue(0)
        self.change_current_point_to(0)
        self.update_latent_scene()

    def change_current_point(self):
        self.change_current_point_to(self.CurrentNodeSpin.value())

    def change_current_point_to(self, point_id):
        self.current_point = point_id
        self.update_line_edit()
        self.update_figure()

    def update_figure(self):
        if not self.freeze_figure:
            self.ax.clear()
            self.reveal_latent_variables(int(self.XDimCombo.currentText()), int(self.YDimCombo.currentText()))
            self.reveal_tracks(int(self.XDimCombo.currentText()), int(self.YDimCombo.currentText()))
            self.LatentView.draw_idle()

    def generate_video(self):
        video_root_path = QFileDialog.getExistingDirectory(self, "Generate Video")
        if video_root_path and video_root_path is not None:
            for track_id, track in enumerate(self.project.tracks):
                _l = self.get_track_length(track_id)
                _sn = int(_l / VIDEO_SAMPLE_RATE)    # sample number

                fourcc = cv2.VideoWriter_fourcc(*'mp4v')
                out = cv2.VideoWriter(os.path.join(video_root_path, f'{track_id}.mp4'), fourcc, 20, (768, 256))

                for _sn_i in range(_sn):
                    lp = self.find_latent_position_given_track_position(_sn_i / (_sn+1), track_id)
                    img = self.estimate_latent_scene(lp)*200
                    img = cv2.cvtColor(img, cv2.COLOR_RGB2BGR)

                    cv2.imwrite(f"~temp.jpg", img)
                    img = cv2.imread(f"~temp.jpg")

                    out.write(img)

                out.release()

    def load_videos(self):
        video_root_path = QFileDialog.getExistingDirectory(self, "Generate Video")
        self.tracks = []
        if video_root_path and video_root_path is not None:
            mp4_files = find_numeric_mp4_files(video_root_path)
            file_id = 0

            while os.path.join(video_root_path, f"{file_id}.mp4") in mp4_files:
                self.tracks.append(Track(os.path.join(video_root_path, f"{file_id}.mp4")))
                file_id += 1

    def closeEvent(self, a0) -> None:
        self.nav_window.close()


class Project:

    def __init__(self):

        self.tracks = []

    def new_track(self):

        self.tracks.append([])

    def replace_point(self, track_id, point_id, new_value):
        if track_id < len(self.tracks) and point_id < len(self.tracks[track_id]):
            self.tracks[track_id][point_id] = new_value

    def add_point(self, track_id, new_value):
        if track_id < len(self.tracks):
            self.tracks[track_id].append(new_value)

    def remove_point(self, track_id, point_id):
        if track_id < len(self.tracks):
            self.tracks[track_id].pop(point_id)

    def save_project(self, filepath):
        with open(filepath, 'wb') as f:
            pickle.dump(self.tracks, f)

    def load_project(self, filepath):
        with open(filepath, 'rb') as f:
            self.tracks = pickle.load(f)


FRAME_CUT = 180


class Track:

    def __init__(self, path):
        frames = []
        frame_cut_this = round(FRAME_CUT / 360 * 768)

        cap = cv2.VideoCapture(path)
        while cap.isOpened():
            ret, frame = cap.read()

            if ret:
                new_image = np.zeros((frame.shape[0], frame.shape[1], 3), dtype=np.uint8)
                new_image[:, :frame_cut_this, :] = frame[:, frame_cut_this:, :]
                new_image[:, frame_cut_this:, :] = frame[:, :frame_cut_this, :]
                frames.append(new_image)
            else:
                break

        self.frames = frames

        cap.release()
