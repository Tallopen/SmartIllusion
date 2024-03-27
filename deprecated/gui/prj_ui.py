from PyQt6.QtCore import *
from PyQt6.QtGui import *
from PyQt6.QtWidgets import *


class prj_ui(object):

    def setupUi(self, Dialog):

        if not Dialog.objectName():
            Dialog.setObjectName(u"Dialog")
        Dialog.resize(457, 381)
        self.verticalLayout = QVBoxLayout(Dialog)
        self.verticalLayout.setObjectName(u"verticalLayout")
        self.groupBox = QGroupBox(Dialog)
        self.groupBox.setObjectName(u"groupBox")
        self.verticalLayout_2 = QVBoxLayout(self.groupBox)
        self.verticalLayout_2.setSpacing(2)
        self.verticalLayout_2.setObjectName(u"verticalLayout_2")
        self.visionCheck = QCheckBox(self.groupBox)
        self.visionCheck.setObjectName(u"visionCheck")

        self.verticalLayout_2.addWidget(self.visionCheck)

        self.horizontalLayout = QHBoxLayout()
        self.horizontalLayout.setObjectName(u"horizontalLayout")
        self.label = QLabel(self.groupBox)
        self.label.setObjectName(u"label")
        self.label.setMinimumSize(QSize(120, 0))
        self.label.setMaximumSize(QSize(120, 16777215))

        self.horizontalLayout.addWidget(self.label)

        self.VisionAEPathLabel = QLabel(self.groupBox)
        self.VisionAEPathLabel.setObjectName(u"VisionAEPathLabel")

        self.horizontalLayout.addWidget(self.VisionAEPathLabel)

        self.setVisionAEButton = QPushButton(self.groupBox)
        self.setVisionAEButton.setObjectName(u"setVisionAEButton")
        self.setVisionAEButton.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout.addWidget(self.setVisionAEButton)

        self.verticalLayout_2.addLayout(self.horizontalLayout)

        self.horizontalLayout_2 = QHBoxLayout()
        self.horizontalLayout_2.setObjectName(u"horizontalLayout_2")
        self.visionUpscalerCheck = QCheckBox(self.groupBox)
        self.visionUpscalerCheck.setObjectName(u"visionUpscalerCheck")
        self.visionUpscalerCheck.setMinimumSize(QSize(120, 0))
        self.visionUpscalerCheck.setMaximumSize(QSize(120, 16777215))

        self.horizontalLayout_2.addWidget(self.visionUpscalerCheck)

        self.VisionUpscalerPathLabel = QLabel(self.groupBox)
        self.VisionUpscalerPathLabel.setObjectName(u"VisionUpscalerPathLabel")

        self.horizontalLayout_2.addWidget(self.VisionUpscalerPathLabel)

        self.setVisionUpscalerButton = QPushButton(self.groupBox)
        self.setVisionUpscalerButton.setObjectName(u"setVisionUpscalerButton")
        self.setVisionUpscalerButton.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_2.addWidget(self.setVisionUpscalerButton)

        self.verticalLayout_2.addLayout(self.horizontalLayout_2)

        self.horizontalLayout_3 = QHBoxLayout()
        self.horizontalLayout_3.setObjectName(u"horizontalLayout_3")
        self.label_4 = QLabel(self.groupBox)
        self.label_4.setObjectName(u"label_4")
        self.label_4.setMaximumSize(QSize(120, 16777215))

        self.horizontalLayout_3.addWidget(self.label_4)

        self.VisionLatentLabel = QLabel(self.groupBox)
        self.VisionLatentLabel.setObjectName(u"VisionLatentLabel")

        self.horizontalLayout_3.addWidget(self.VisionLatentLabel)

        self.setVisionLatentButton = QPushButton(self.groupBox)
        self.setVisionLatentButton.setObjectName(u"setVisionLatentButton")
        self.setVisionLatentButton.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_3.addWidget(self.setVisionLatentButton)

        self.verticalLayout_2.addLayout(self.horizontalLayout_3)

        self.verticalLayout.addWidget(self.groupBox)

        self.groupBox_2 = QGroupBox(Dialog)
        self.groupBox_2.setObjectName(u"groupBox_2")
        self.verticalLayout_3 = QVBoxLayout(self.groupBox_2)
        self.verticalLayout_3.setSpacing(2)
        self.verticalLayout_3.setObjectName(u"verticalLayout_3")
        self.audioCheck = QCheckBox(self.groupBox_2)
        self.audioCheck.setObjectName(u"audioCheck")

        self.verticalLayout_3.addWidget(self.audioCheck)

        self.horizontalLayout_4 = QHBoxLayout()
        self.horizontalLayout_4.setObjectName(u"horizontalLayout_4")
        self.label_6 = QLabel(self.groupBox_2)
        self.label_6.setObjectName(u"label_6")
        self.label_6.setMinimumSize(QSize(120, 0))
        self.label_6.setMaximumSize(QSize(120, 16777215))

        self.horizontalLayout_4.addWidget(self.label_6)

        self.AudioAEPathLabel = QLabel(self.groupBox_2)
        self.AudioAEPathLabel.setObjectName(u"AudioAEPathLabel")

        self.horizontalLayout_4.addWidget(self.AudioAEPathLabel)

        self.setAudioAEButton = QPushButton(self.groupBox_2)
        self.setAudioAEButton.setObjectName(u"setAudioAEButton")
        self.setAudioAEButton.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_4.addWidget(self.setAudioAEButton)


        self.verticalLayout_3.addLayout(self.horizontalLayout_4)

        self.horizontalLayout_5 = QHBoxLayout()
        self.horizontalLayout_5.setObjectName(u"horizontalLayout_5")
        self.label_8 = QLabel(self.groupBox_2)
        self.label_8.setObjectName(u"label_8")
        self.label_8.setMaximumSize(QSize(120, 16777215))

        self.horizontalLayout_5.addWidget(self.label_8)

        self.AudioLatentLabel = QLabel(self.groupBox_2)
        self.AudioLatentLabel.setObjectName(u"AudioLatentLabel")

        self.horizontalLayout_5.addWidget(self.AudioLatentLabel)

        self.setAudioLatentButton = QPushButton(self.groupBox_2)
        self.setAudioLatentButton.setObjectName(u"setAudioLatentButton")
        self.setAudioLatentButton.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_5.addWidget(self.setAudioLatentButton)


        self.verticalLayout_3.addLayout(self.horizontalLayout_5)


        self.verticalLayout.addWidget(self.groupBox_2)

        self.groupBox_3 = QGroupBox(Dialog)
        self.groupBox_3.setObjectName(u"groupBox_3")
        self.verticalLayout_4 = QVBoxLayout(self.groupBox_3)
        self.verticalLayout_4.setSpacing(2)
        self.verticalLayout_4.setObjectName(u"verticalLayout_4")
        self.odorCheck = QCheckBox(self.groupBox_3)
        self.odorCheck.setObjectName(u"odorCheck")

        self.verticalLayout_4.addWidget(self.odorCheck)

        self.horizontalLayout_6 = QHBoxLayout()
        self.horizontalLayout_6.setObjectName(u"horizontalLayout_6")
        self.label_10 = QLabel(self.groupBox_3)
        self.label_10.setObjectName(u"label_10")
        self.label_10.setMaximumSize(QSize(160, 16777215))

        self.horizontalLayout_6.addWidget(self.label_10)

        self.odorLatentDimensionSpin = QSpinBox(self.groupBox_3)
        self.odorLatentDimensionSpin.setObjectName(u"odorLatentDimensionSpin")
        self.odorLatentDimensionSpin.setMinimumSize(QSize(40, 0))
        self.odorLatentDimensionSpin.setMinimum(4)
        self.odorLatentDimensionSpin.setMaximum(8)

        self.horizontalLayout_6.addWidget(self.odorLatentDimensionSpin)

        self.horizontalSpacer = QSpacerItem(40, 20, QSizePolicy.Policy.Expanding, QSizePolicy.Policy.Minimum)

        self.horizontalLayout_6.addItem(self.horizontalSpacer)


        self.verticalLayout_4.addLayout(self.horizontalLayout_6)


        self.verticalLayout.addWidget(self.groupBox_3)

        self.buttonBox = QDialogButtonBox(Dialog)
        self.buttonBox.setObjectName(u"buttonBox")
        self.buttonBox.setLocale(QLocale(QLocale.Language.English, QLocale.Country.UnitedStates))
        self.buttonBox.setOrientation(Qt.Orientation.Horizontal)
        self.buttonBox.setStandardButtons(QDialogButtonBox.StandardButton.Cancel|QDialogButtonBox.StandardButton.Ok)

        self.verticalLayout.addWidget(self.buttonBox)

        self.retranslateUi(Dialog)
        self.buttonBox.accepted.connect(Dialog.accept)
        self.buttonBox.rejected.connect(Dialog.reject)
    # setupUi

    def retranslateUi(self, Dialog):
        Dialog.setWindowTitle(QCoreApplication.translate("Dialog", u"Project Settings", None))
        self.groupBox.setTitle(QCoreApplication.translate("Dialog", u"Vision", None))
        self.visionCheck.setText(QCoreApplication.translate("Dialog", u"Enable This", None))
        self.label.setText(QCoreApplication.translate("Dialog", u"Base Auto-encoder:", None))
        self.VisionAEPathLabel.setText(QCoreApplication.translate("Dialog", u"(None)", None))
        self.setVisionAEButton.setText(QCoreApplication.translate("Dialog", u"Set", None))
        self.visionUpscalerCheck.setText(QCoreApplication.translate("Dialog", u"Upscaler:", None))
        self.VisionUpscalerPathLabel.setText(QCoreApplication.translate("Dialog", u"(None)", None))
        self.setVisionUpscalerButton.setText(QCoreApplication.translate("Dialog", u"Set", None))
        self.label_4.setText(QCoreApplication.translate("Dialog", u"Latent Samples: ", None))
        self.VisionLatentLabel.setText(QCoreApplication.translate("Dialog", u"(None)", None))
        self.setVisionLatentButton.setText(QCoreApplication.translate("Dialog", u"Set", None))
        self.groupBox_2.setTitle(QCoreApplication.translate("Dialog", u"Audio", None))
        self.audioCheck.setText(QCoreApplication.translate("Dialog", u"Enable This", None))
        self.label_6.setText(QCoreApplication.translate("Dialog", u"Base Auto-encoder:", None))
        self.AudioAEPathLabel.setText(QCoreApplication.translate("Dialog", u"(None)", None))
        self.setAudioAEButton.setText(QCoreApplication.translate("Dialog", u"Set", None))
        self.label_8.setText(QCoreApplication.translate("Dialog", u"Latent Samples: ", None))
        self.AudioLatentLabel.setText(QCoreApplication.translate("Dialog", u"(None)", None))
        self.setAudioLatentButton.setText(QCoreApplication.translate("Dialog", u"Set", None))
        self.groupBox_3.setTitle(QCoreApplication.translate("Dialog", u"Odor", None))
        self.odorCheck.setText(QCoreApplication.translate("Dialog", u"Enable This", None))
        self.label_10.setText(QCoreApplication.translate("Dialog", u"Latent Dimension Number: ", None))


class ProjectPropertyUI(QDialog):

    def __init__(self, original_project):

        super(ProjectPropertyUI, self).__init__()

        self.ui = prj_ui()
        self.ui.setupUi(self)

        self.ui.visionCheck.setChecked(original_project.visual_enabled)
        self.ui.visionUpscalerCheck.setChecked(original_project.enable_visual_upscaler)
        self.ui.audioCheck.setChecked(original_project.audio_enabled)
        self.ui.odorCheck.setChecked(original_project.odor_enabled)

        self.ui.setVisionAEButton.setEnabled(original_project.visual_enabled)
        self.ui.setVisionUpscalerButton.setEnabled(original_project.visual_enabled and original_project.enable_visual_upscaler)
        self.ui.setVisionLatentButton.setEnabled(original_project.visual_enabled)
        self.ui.setAudioAEButton.setEnabled(original_project.audio_enabled)
        self.ui.setAudioLatentButton.setEnabled(original_project.audio_enabled)
        self.ui.odorLatentDimensionSpin.setEnabled(original_project.odor_enabled)

        if original_project.visual_enabled:
            self.ui.VisionAEPathLabel.setText(original_project.visual_autoencoder_path
                                              if original_project.visual_autoencoder_path is not None else "None")
            self.ui.VisionUpscalerPathLabel.setText(original_project.visual_upscaler_path
                                                    if original_project.visual_upscaler_path is not None else "None")
            self.ui.VisionLatentLabel.setText(original_project.visual_latent_path
                                              if original_project.visual_latent_path is not None else "None")

        if original_project.audio_enabled:
            self.ui.AudioAEPathLabel.setText(original_project.audio_compressor_path
                                             if original_project.audio_compressor_path is not None else "None")
            self.ui.AudioLatentLabel.setText(original_project.audio_latent_path
                                             if original_project.audio_latent_path is not None else "None")

        if original_project.odor_enabled:
            self.ui.odorLatentDimensionSpin.setValue(original_project.odor_dim)

        self.options = {
            "visual_enabled": original_project.visual_enabled,
            "visual_autoencoder_path": original_project.visual_autoencoder_path,
            "visual_upscaler_enabled": original_project.enable_visual_upscaler,
            "visual_upscaler_path": original_project.visual_upscaler_path,
            "visual_latent_path": original_project.visual_latent_path,

            "audio_enabled": original_project.audio_enabled,
            "audio_compressor_path": original_project.audio_compressor_path,
            "audio_latent_path": original_project.audio_latent_path,

            "odor_enabled": original_project.odor_enabled,
            "odor_dim": original_project.odor_dim
        }

        self.ui.visionCheck.clicked.connect(self.toggle_visual_enabled)
        self.ui.audioCheck.clicked.connect(self.toggle_audio_enabled)
        self.ui.odorCheck.clicked.connect(self.toggle_odor_enabled)
        self.ui.visionUpscalerCheck.clicked.connect(self.toggle_upscaler_enabled)

        self.ui.setVisionAEButton.clicked.connect(self.set_visual_autoencoder_path)
        self.ui.setVisionUpscalerButton.clicked.connect(self.set_visual_upscaler_path)
        self.ui.setVisionLatentButton.clicked.connect(self.set_visual_latent_path)
        self.ui.setAudioAEButton.clicked.connect(self.set_audio_compressor_path)
        self.ui.setAudioLatentButton.clicked.connect(self.set_audio_latent_path)
        self.ui.odorLatentDimensionSpin.valueChanged.connect(self.set_odor_dim)

    def toggle_visual_enabled(self):
        enable_state = self.ui.visionCheck.isChecked()

        self.options["visual_enabled"] = enable_state
        self.ui.setVisionAEButton.setEnabled(enable_state)
        self.ui.visionUpscalerCheck.setEnabled(enable_state)
        self.ui.setVisionUpscalerButton.setEnabled(enable_state and self.ui.visionUpscalerCheck.isChecked())
        self.ui.setVisionLatentButton.setEnabled(enable_state)

    def toggle_upscaler_enabled(self):
        enable_state = self.ui.visionUpscalerCheck.isChecked()

        self.options["visual_upscaler_enabled"] = enable_state
        self.ui.setVisionUpscalerButton.setEnabled(enable_state)

    def toggle_audio_enabled(self):
        enable_state = self.ui.audioCheck.isChecked()

        self.options["audio_enabled"] = enable_state
        self.ui.setAudioAEButton.setEnabled(enable_state)
        self.ui.setAudioLatentButton.setEnabled(enable_state)

    def toggle_odor_enabled(self):
        enable_state = self.ui.odorCheck.isChecked()

        self.options["odor_enabled"] = enable_state
        self.ui.odorLatentDimensionSpin.setEnabled(enable_state)

    def set_visual_autoencoder_path(self):
        returned_directory = QFileDialog.getExistingDirectory(self, "Choose Visual Autoencoder")
        if returned_directory and returned_directory is not None:
            self.options["visual_autoencoder_path"] = returned_directory
            self.ui.VisionAEPathLabel.setText(returned_directory)

    def set_visual_upscaler_path(self):
        returned_directory = QFileDialog.getExistingDirectory(self, "Choose Visual Upscaler")
        if returned_directory and returned_directory is not None:
            self.options["visual_upscaler_path"] = returned_directory
            self.ui.VisionUpscalerPathLabel.setText(returned_directory)

    def set_visual_latent_path(self):
        returned_directory = QFileDialog.getOpenFileName(self, "Choose Visual Latent Embeddings")
        if returned_directory[0] and returned_directory[0] is not None:
            self.options["visual_latent_path"] = returned_directory[0]
            self.ui.VisionLatentLabel.setText(returned_directory[0])

    def set_audio_compressor_path(self):
        returned_directory = QFileDialog.getExistingDirectory(self, "Choose Audio Compressor")
        if returned_directory and returned_directory is not None:
            self.options["audio_compressor_path"] = returned_directory
            self.ui.AudioAEPathLabel.setText(returned_directory)

    def set_audio_latent_path(self):
        returned_directory = QFileDialog.getOpenFileName(self, "Choose Audio Latent Embeddings")
        if returned_directory[0] and returned_directory[0] is not None:
            self.options["audio_latent_path"] = returned_directory[0]
            self.ui.AudioLatentLabel.setText(returned_directory[0])

    def set_odor_dim(self):
        self.options["odor_dim"] = self.ui.odorLatentDimensionSpin.value()

    def exec(self):
        _v = super(ProjectPropertyUI, self).exec()

        if _v:
            return self.options, _v
        else:
            return None, _v


def ask_for_project_property(project):
    return ProjectPropertyUI(project).exec()
