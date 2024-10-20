import os
import os.path
import pickle
import re
import sys
import time

import cv2

from PyQt6.QtCore import *
from PyQt6.QtGui import *
from PyQt6.QtWidgets import *

import numpy as np
import sounddevice as sd
import threading

import socket, math

LOCAL_IP = "127.0.0.1"
FRAME_CUT = 180
VIDEO_SAMPLE_RATE = 10

POSITION_UDP = 4515
REWARD_UDP = 4516


def create_dict_from_files(folder_name, file_type="mp4"):
    result_dict = {}
    files = os.listdir(folder_name)
    pattern = re.compile(f'^(\\d+)-(\\d+)\\.{file_type}$')

    for file_name in files:
        match = pattern.match(file_name)
        if match:
            key = int(match.group(1))
            if key not in result_dict:
                result_dict[key] = {}
            result_dict[key][match.group(2)] = os.path.join(folder_name, file_name)

    return result_dict


def call_runner(exported_data_path, mode):
    app = QApplication([])

    splash = QSplashScreen(QPixmap("gui/ico/splash.png"))
    splash.show()

    ex = RunnerUI(exported_data_path, "v" in mode, "a" in mode, "o" in mode)
    splash.finish(ex)
    splash.deleteLater()
    ex.show()

    sys.exit(app.exec())


class RunnerUI(QMainWindow):

    def __init__(self, exported_data_path, vision=False, audio=False, odor=False):
        super(RunnerUI, self).__init__()

        self.centralwidget = QWidget(self)
        self.horizontalLayout = QHBoxLayout(self.centralwidget)
        self.runButton = QPushButton(self.centralwidget)

        self.horizontalLayout.addWidget(self.runButton)

        self.terminateButton = QPushButton(self.centralwidget)

        self.horizontalLayout.addWidget(self.terminateButton)

        self.setCentralWidget(self.centralwidget)

        self.setWindowTitle(u"SmartIllusion Control")
        self.runButton.setText(u"Run")
        self.terminateButton.setText(u"Terminate")

        self.last_time = 0

        self.vision = {}
        self.audio = {}
        self.odor = {}

        if vision:
            _v_root = os.path.join(exported_data_path, "v")
            _v_paths = create_dict_from_files(_v_root)
            for track_id, weight_comb in _v_paths.items():
                self.vision[track_id] = {}
                for weight_id, file_path in weight_comb.items():
                    frames = []
                    frame_cut_this = round(FRAME_CUT / 360 * 768)

                    cap = cv2.VideoCapture(file_path)
                    while cap.isOpened():
                        ret, frame = cap.read()

                        if ret:
                            new_image = np.zeros((frame.shape[0], frame.shape[1], 3), dtype=np.uint8)
                            new_image[:, :frame_cut_this, :] = frame[:, frame_cut_this:, :]
                            new_image[:, frame_cut_this:, :] = frame[:, :frame_cut_this, :]
                            frames.append(new_image)
                        else:
                            break

                    self.vision[track_id][weight_id] = frames
                    cap.release()

        if audio:
            _a_root = os.path.join(exported_data_path, "a")
            _a_paths = create_dict_from_files(_a_root, "siw")
            for track_id, weight_comb in _a_paths.items():
                self.audio[track_id] = {}
                for weight_id, file_path in weight_comb.items():
                    with open(file_path, 'rb') as f:
                        self.audio[track_id][weight_id] = pickle.load(f)

        self.nav_window = None

        black_image = np.zeros((256, 768, 3), dtype=np.uint8)
        q_image = QImage(black_image.data, black_image.shape[1], black_image.shape[0],
                         black_image.strides[0], QImage.Format.Format_RGB888)
        self.blank_img = QPixmap.fromImage(q_image)

        self.nav_displayer = None

        if vision:
            self.initialize_video_player()
        self.sound_player = SoundPlayer() if audio else None

        self.position = 0
        self.current_track_id = None
        self.current_comb_id = None

        self.client_socket_p = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.position_socket = (LOCAL_IP, POSITION_UDP)
        self.client_socket_r = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.reward_socket = (LOCAL_IP, REWARD_UDP)

        self.runButton.clicked.connect(self.run)
        self.terminateButton.clicked.connect(sys.exit)

        self.terminateButton.setEnabled(False)

    def initialize_video_player(self):
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

    def run(self):
        self.runButton.setEnabled(False)
        self.terminateButton.setEnabled(True)

        self.instruction_thread = InstructionThread()
        self.speed_thread = SpeedThread()

        self.last_time = time.time()
        self.speed_thread.speed_received.connect(self.speed_received)
        self.instruction_thread.instruction_received.connect(self.instruction_received)

        self.instruction_thread.start()
        self.speed_thread.start()
        if self.sound_player:
            self.sound_player.start()

    def speed_received(self, speed):
        if self.current_track_id is not None:
            _new_time = time.time()
            delta_time = _new_time - self.last_time
            self.last_time = _new_time
            self.position += speed * VIDEO_SAMPLE_RATE * delta_time
            img_switch = max(0, int(self.position))

            if img_switch >= len(self.vision[self.current_track_id][self.current_comb_id]):
                if self.vision:
                    self.nav_displayer.setPixmap(self.blank_img)
                if self.audio:
                    self.sound_player.update_new_signal([])

                self.position = 0
                self.current_track_id = None
                self.current_comb_id = None
                self.client_socket_r.sendto("r1".encode(encoding="utf8"), self.reward_socket)
                # self.client_socket_p.sendto(f"0,{self.running_pos}".encode(encoding="utf8"), self.position_socket)
            else:
                if self.vision:
                    current_img = self.vision[self.current_track_id][self.current_comb_id][img_switch]
                    q_image = QImage(current_img.data, current_img.shape[1], current_img.shape[0], current_img.strides[0], QImage.Format.Format_BGR888)
                    self.nav_displayer.setPixmap(QPixmap(q_image))
                if self.audio:
                    self.sound_player.update_new_signal(self.audio[self.current_track_id][self.current_comb_id][img_switch])

                self.client_socket_p.sendto(f"0,{round(self.position, 2)}".encode(encoding="utf8"), self.position_socket)
        else:
            self.last_time = time.time()

    def instruction_received(self, message):
        message = message.split(',')
        message_type = message[0]

        if message_type == "TM":
            _tid = int(message[1])
            _cid = message[2]

            if _tid in self.vision and _cid in self.vision[_tid]:
                self.position = 0
                self.current_track_id = _tid
                self.current_comb_id = _cid

                current_img = self.vision[self.current_track_id][self.current_comb_id][0]
                q_image = QImage(current_img.data, current_img.shape[1], current_img.shape[0], current_img.strides[0],
                                 QImage.Format.Format_RGB888)
                self.nav_displayer.setPixmap(QPixmap(q_image))

            if _tid in self.audio and _cid in self.audio[_tid]:
                self.position = 0
                self.current_track_id = _tid
                self.current_comb_id = _cid
                self.sound_player.update_new_signal(self.audio[self.current_track_id][self.current_comb_id][0])


class SoundPlayer(QThread):

    def __init__(self):
        super(SoundPlayer, self).__init__()
        self.step_size = 4096
        self.blank_signal = np.zeros([self.step_size, 1])
        self.signal = self.blank_signal
        self.is_running = False

    def update_new_signal(self, sequence):
        if len(sequence):
            self.signal = np.expand_dims(sequence[0, :], 1)
        else:
            self.signal = self.blank_signal

    def get_data(self, outdata, frames, time, status):
        outdata[:] = self.signal

    def run(self):
        self.is_running = True
        event = threading.Event()
        stream = sd.OutputStream(samplerate=48000, blocksize=self.step_size,
                                 device=1, channels=1,
                                 callback=self.get_data, finished_callback=event.set)
        with stream:
            while self.is_running:
                time.sleep(0.001)

    def stop(self):
        self.is_running = False


class InstructionThread(QThread):

    instruction_received = pyqtSignal(str, name="instruction_received")

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
