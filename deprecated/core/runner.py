import time

from PyQt6.QtCore import *
from PyQt6.QtGui import *
from PyQt6.QtWidgets import *

import numpy as np
import sounddevice as sd
import threading

import socket, math

LOCAL_IP = "127.0.0.1"


class SoundPlayer(QThread):

    def __init__(self):
        super(SoundPlayer, self).__init__()
        self.fourier_sequence = np.array([[]])
        self.step_size = 8192
        self.signal = np.array([])
        self.is_running = False

    def update_new_signal(self, fourier_sequence):
        self.fourier_sequence = fourier_sequence
        if len(self.fourier_sequence):
            n_sig = np.fft.irfft(((self.fourier_sequence[:, :4096] + self.fourier_sequence[:, 4096:] * 1j)) * 3, self.step_size*2)
            self.signal = n_sig[0, 2048:(2048+self.step_size)]

    def get_data(self):
        return self.signal

    def run(self):
        self.is_running = True
        event = threading.Event()
        stream = sd.OutputStream(samplerate=192000, blocksize=self.step_size,
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
