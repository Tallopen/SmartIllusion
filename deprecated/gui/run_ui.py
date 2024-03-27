from PyQt6.QtCore import *
from PyQt6.QtGui import *
from PyQt6.QtWidgets import *


class run_ui(object):

    def setupUi(self, Form):

        if not Form.objectName():
            Form.setObjectName(u"Form")
        Form.resize(365, 219)
        self.verticalLayout = QVBoxLayout(Form)
        self.verticalLayout.setObjectName(u"verticalLayout")
        self.groupBox = QGroupBox(Form)
        self.groupBox.setObjectName(u"groupBox")
        self.verticalLayout_2 = QVBoxLayout(self.groupBox)
        self.verticalLayout_2.setObjectName(u"verticalLayout_2")
        self.randomCheck = QCheckBox(self.groupBox)
        self.randomCheck.setObjectName(u"randomCheck")

        self.verticalLayout_2.addWidget(self.randomCheck)

        self.horizontalLayout_2 = QHBoxLayout()
        self.horizontalLayout_2.setObjectName(u"horizontalLayout_2")
        self.label = QLabel(self.groupBox)
        self.label.setObjectName(u"label")

        self.horizontalLayout_2.addWidget(self.label)

        self.darkLowLimitLine = QLineEdit(self.groupBox)
        self.darkLowLimitLine.setObjectName(u"darkLowLimitLine")

        self.horizontalLayout_2.addWidget(self.darkLowLimitLine)

        self.label_2 = QLabel(self.groupBox)
        self.label_2.setObjectName(u"label_2")

        self.horizontalLayout_2.addWidget(self.label_2)

        self.darkUpLimitLine = QLineEdit(self.groupBox)
        self.darkUpLimitLine.setObjectName(u"darkUpLimitLine")

        self.horizontalLayout_2.addWidget(self.darkUpLimitLine)

        self.verticalLayout_2.addLayout(self.horizontalLayout_2)

        self.horizontalLayout_3 = QHBoxLayout()
        self.horizontalLayout_3.setObjectName(u"horizontalLayout_3")
        self.label_3 = QLabel(self.groupBox)
        self.label_3.setObjectName(u"label_3")

        self.horizontalLayout_3.addWidget(self.label_3)

        self.transitionWidthLine = QLineEdit(self.groupBox)
        self.transitionWidthLine.setObjectName(u"transitionWidthLine")

        self.horizontalLayout_3.addWidget(self.transitionWidthLine)

        self.verticalLayout_2.addLayout(self.horizontalLayout_3)

        self.horizontalLayout_4 = QHBoxLayout()
        self.horizontalLayout_4.setObjectName(u"horizontalLayout_4")
        self.checkBox = QCheckBox(self.groupBox)
        self.checkBox.setObjectName(u"checkBox")

        self.horizontalLayout_4.addWidget(self.checkBox)

        self.checkBox_3 = QCheckBox(self.groupBox)
        self.checkBox_3.setObjectName(u"checkBox_3")

        self.horizontalLayout_4.addWidget(self.checkBox_3)

        self.checkBox_2 = QCheckBox(self.groupBox)
        self.checkBox_2.setObjectName(u"checkBox_2")

        self.horizontalLayout_4.addWidget(self.checkBox_2)

        self.verticalLayout_2.addLayout(self.horizontalLayout_4)

        self.verticalLayout.addWidget(self.groupBox)

        self.horizontalLayout_5 = QHBoxLayout()
        self.horizontalLayout_5.setObjectName(u"horizontalLayout_5")
        self.label_4 = QLabel(Form)
        self.label_4.setObjectName(u"label_4")
        self.label_4.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_5.addWidget(self.label_4)

        self.label_5 = QLabel(Form)
        self.label_5.setObjectName(u"label_5")

        self.horizontalLayout_5.addWidget(self.label_5)

        self.pushButton = QPushButton(Form)
        self.pushButton.setObjectName(u"pushButton")
        self.pushButton.setMaximumSize(QSize(80, 16777215))

        self.horizontalLayout_5.addWidget(self.pushButton)

        self.verticalLayout.addLayout(self.horizontalLayout_5)

        self.horizontalLayout = QHBoxLayout()
        self.horizontalLayout.setObjectName(u"horizontalLayout")
        self.runButton = QPushButton(Form)
        self.runButton.setObjectName(u"runButton")

        self.horizontalLayout.addWidget(self.runButton)

        self.terminateButton = QPushButton(Form)
        self.terminateButton.setObjectName(u"terminateButton")
        self.terminateButton.setEnabled(False)

        self.horizontalLayout.addWidget(self.terminateButton)

        self.verticalLayout.addLayout(self.horizontalLayout)

        self.retranslateUi(Form)

    def retranslateUi(self, Form):
        Form.setWindowTitle(QCoreApplication.translate("Form", u"Run New Session", None))
        self.groupBox.setTitle(QCoreApplication.translate("Form", u"Random Strength Combination", None))
        self.randomCheck.setText(QCoreApplication.translate("Form", u"Enable This", None))
        self.label.setText(QCoreApplication.translate("Form", u"Uniform Dark Area:", None))
        self.label_2.setText(QCoreApplication.translate("Form", u"to", None))
        self.label_3.setText(QCoreApplication.translate("Form", u"Transition Area Width: ", None))
        self.checkBox.setText(QCoreApplication.translate("Form", u"Vision", None))
        self.checkBox_3.setText(QCoreApplication.translate("Form", u"Audio", None))
        self.checkBox_2.setText(QCoreApplication.translate("Form", u"Odor", None))
        self.label_4.setText(QCoreApplication.translate("Form", u"VR Folder:", None))
        self.label_5.setText(QCoreApplication.translate("Form", u"(None)", None))
        self.pushButton.setText(QCoreApplication.translate("Form", u"Set", None))
        self.runButton.setText(QCoreApplication.translate("Form", u"Run", None))
        self.terminateButton.setText(QCoreApplication.translate("Form", u"Terminate", None))

