from PyQt6.QtCore import *
from PyQt6.QtGui import *
from PyQt6.QtWidgets import *

from gui import *
from core.project import Project


def number_filter(string_2_filter):
    try:
        return float(string_2_filter)
    except:
        return 0


class GUIMain(QMainWindow):

    def __init__(self):
        super(GUIMain, self).__init__()

        self.ui = main_ui(self)

        self.project = None
        self.project_path = None
        self.ui.actionProject_Settings.triggered.connect(self.edit_project_properties)
        self.ui.actionNew_project.triggered.connect(self.new_project)
        self.ui.actionOpen_project.triggered.connect(self.load_project)
        self.ui.actionClose_Project.triggered.connect(self.close_project)
        self.ui.actionSave_Project.triggered.connect(self.save_project)

        self.enable_preview = False
        self.ui.previewEnableCheck.clicked.connect(self.toggle_preview_enabled)

        self.toggle_preview_enabled()
        self.ui.toggle_project_editing(False)
        self.set_ui_following_project_property()

        self.ui.dimACombo.currentIndexChanged.connect(self.dim_combo_change)
        self.ui.dimBCombo.currentIndexChanged.connect(self.dim_combo_change)
        self.ui.dimCCombo.currentIndexChanged.connect(self.dim_combo_change)
        self.ui.dimDCombo.currentIndexChanged.connect(self.dim_combo_change)

        self.left = 0
        self.ui.newTrackButton.clicked.connect(self.add_track)
        self.ui.RemoveTrackButton.clicked.connect(self.remove_track)

        self.ui.Atrack.patch_select.connect(self.patch_select)
        self.ui.Vtrack.patch_select.connect(self.patch_select)
        self.ui.Otrack.patch_select.connect(self.patch_select)
        self.ui.Atrack.patch_insert.connect(self.patch_insert)
        self.ui.Vtrack.patch_insert.connect(self.patch_insert)
        self.ui.Otrack.patch_insert.connect(self.patch_insert)
        self.ui.Atrack.patch_remove.connect(self.patch_remove)
        self.ui.Vtrack.patch_remove.connect(self.patch_remove)
        self.ui.Otrack.patch_remove.connect(self.patch_remove)

        self.ui.Va.returnPressed.connect(self.edit_point_visual)
        self.ui.Vb.returnPressed.connect(self.edit_point_visual)
        self.ui.Vc.returnPressed.connect(self.edit_point_visual)
        self.ui.Vd.returnPressed.connect(self.edit_point_visual)
        self.ui.Aa.returnPressed.connect(self.edit_point_audio)
        self.ui.Ab.returnPressed.connect(self.edit_point_audio)
        self.ui.Ac.returnPressed.connect(self.edit_point_audio)
        self.ui.Ad.returnPressed.connect(self.edit_point_audio)
        self.ui.Oa.returnPressed.connect(self.edit_point_odor)
        self.ui.Ob.returnPressed.connect(self.edit_point_odor)
        self.ui.Oc.returnPressed.connect(self.edit_point_odor)
        self.ui.Od.returnPressed.connect(self.edit_point_odor)

        self.ui.trackIIDSpin.valueChanged.connect(self.switch_track_id)

        self.ui.addWeightButton.clicked.connect(self.add_combination)
        self.ui.removeWeightButton.clicked.connect(self.remove_combination)
        self.ui.weightSpin.valueChanged.connect(self.switch_combination_id)

        self.ui.Vx.returnPressed.connect(self.edit_combination_point_visual)
        self.ui.Vy.returnPressed.connect(self.edit_combination_point_visual)
        self.ui.Ax.returnPressed.connect(self.edit_combination_point_audio)
        self.ui.Ay.returnPressed.connect(self.edit_combination_point_audio)
        self.ui.Ox.returnPressed.connect(self.edit_combination_point_odor)
        self.ui.Oy.returnPressed.connect(self.edit_combination_point_odor)

        self.update_point_coordinate()
        self.track_point_not_locked = True
        self.combination_point_not_locked = True

    def switch_combination_id(self):
        if self.project is not None:
            self.project.current_comb_id = self.ui.weightSpin.value()
            self.project.current_pt_id = 0

            self.update_combination()

    def dim_combo_change(self):
        self.update_latent_tracks()
        self.update_point_coordinate()

    def edit_project_properties(self):
        if self.project is None:
            QMessageBox.warning(self, "Edit Project Settings", "There is no project open yet. To proceed, open one.")
        else:
            _p = ask_for_project_property(self.project)
            self.project.set_properties(_p)
            self.set_ui_following_project_property()

    def new_project(self):
        self.project = Project()
        self.ui.toggle_project_editing(True)

    def close_project(self):
        self.project = None
        self.set_ui_following_project_property()
        self.ui.toggle_project_editing(False)

    def save_project(self):
        if self.project_path is None:
            returned_directory = QFileDialog.getSaveFileName(self, "Save Project", "", "SmartIllusion Multi-modal Project File (*.smp)")
            if returned_directory[0] and returned_directory[0] is not None:
                self.project_path = returned_directory[0]
            else:
                QMessageBox.warning(self, "Save Project",
                                    "Your path input is not valid.")
                return
        self.project.serialize(self.project_path)

    def load_project(self):
        self.close_project()
        returned_directory = QFileDialog.getOpenFileName(self, "Load Project", "",
                                                         "SmartIllusion Multi-modal Project File (*.smp)")
        if returned_directory[0] and returned_directory[0] is not None:
            self.project_path = returned_directory[0]
        else:
            QMessageBox.critical(self, "Load Project",
                                 "Your path input is not valid.")
            return

        try:
            self.project = Project()
            self.project.load_from(self.project_path)
            if len(self.project.tracks):
                self.project.current_track_id = 0
            self.set_ui_following_project_property()
            self.ui.toggle_project_editing(True)
            self.toggle_spin_enabled()

        except Exception as e:
            QMessageBox.critical(self, "Load Project",
                                 f"The project file cannot be loaded because: \n{e.args}")

    def toggle_spin_enabled(self):
        if self.project is not None:
            if len(self.project.tracks) == 0:
                self.ui.trackIIDSpin.setEnabled(False)
                self.ui.RemoveTrackButton.setEnabled(False)
            else:
                self.ui.trackIIDSpin.setEnabled(True)
                self.ui.RemoveTrackButton.setEnabled(True)
                self.ui.trackIIDSpin.setMaximum(len(self.project.tracks)-1)
        else:
            self.ui.trackIIDSpin.setEnabled(False)
            self.ui.RemoveTrackButton.setEnabled(False)

    def switch_track_id(self):
        if self.project is not None:
            self.project.current_track_id = self.ui.trackIIDSpin.value()
            self.project.current_comb_id = 0 if len(self.project.tracks[self.project.current_track_id].visual_combinations) else None
            self.project.current_comb_pt_id = None

            self.patch_select(-1)

            self.update_latent_space_scatter()
            self.update_combination()

    def toggle_preview_enabled(self):
        self.ui.toggle_preview_enabled(self.ui.previewEnableCheck.isChecked())

    def set_ui_following_project_property(self):
        if self.project is None:
            self.ui.toggle_vision_enabled(False)
            self.ui.toggle_audio_enabled(False)
            self.ui.toggle_odor_enabled(False)
            self.ui.set_vao_combo_dimension(0)
            self.update_latent_space_scatter()
        else:
            self.ui.toggle_vision_enabled(self.project.visual_enabled)
            self.ui.toggle_audio_enabled(self.project.audio_enabled)
            self.ui.toggle_odor_enabled(self.project.odor_enabled)

            _max_dim = max(self.project.visual_dim, self.project.audio_dim, self.project.odor_dim)
            if _max_dim >= 4:
                self.ui.set_vao_combo_dimension(_max_dim, [1, 2, 3, 4])
            else:
                self.ui.set_vao_combo_dimension(_max_dim)

            if self.project.visual_enabled and self.project.visual_latent_space is not None:
                self.ui.Vtrack.ylim = self.project.visual_latent_space.get_range()
            if self.project.audio_enabled and self.project.audio_latent_space is not None:
                self.ui.Atrack.ylim = self.project.audio_latent_space.get_range()
            if self.project.odor_enabled and self.project.odor_latent_space is not None:
                self.ui.Otrack.ylim = self.project.odor_latent_space.get_range()

            self.update_latent_tracks()

        self.update_combination()

    def get_dimension_set(self):
        return [0 if _c.currentText() == "None" or not _c.currentText() else int(_c.currentText()) for _c in self.ui.dim_combo_set]

    def update_latent_space_scatter(self):
        if self.project is None:
            self.ui.scatter_latent_space(None, [0, 0, 0, 0], modality="v")
            self.ui.scatter_latent_space(None, [0, 0, 0, 0], modality="a")
            self.ui.scatter_latent_space(None, [0, 0, 0, 0], modality="o")
        else:
            _dimension_set = self.get_dimension_set()
            if self.project.visual_enabled:
                self.ui.scatter_latent_space(self.project.visual_latent_space, _dimension_set, self.project.tracks, self.project.current_track_id, modality="v")
            else:
                self.ui.scatter_latent_space(None, [0, 0, 0, 0], modality="v")

            if self.project.audio_enabled:
                self.ui.scatter_latent_space(self.project.audio_latent_space, _dimension_set, self.project.tracks, self.project.current_track_id, modality="a")
            else:
                self.ui.scatter_latent_space(None, [0, 0, 0, 0], modality="a")

            if self.project.odor_enabled:
                self.ui.scatter_latent_space(self.project.odor_latent_space, _dimension_set, self.project.tracks, self.project.current_track_id, modality="o")
            else:
                self.ui.scatter_latent_space(None, [0, 0, 0, 0], modality="o")

    def update_latent_tracks(self):
        if self.project is None or len(self.project.tracks) == 0 or self.project.current_track_id is None:
            self.ui.plot_latent_tracks(None, modality="v")
            self.ui.plot_latent_tracks(None, modality="a")
            self.ui.plot_latent_tracks(None, modality="o")
        else:
            _dim_set = self.get_dimension_set()
            if self.project.visual_enabled:
                self.ui.plot_latent_tracks(self.project.tracks[self.project.current_track_id], _dim_set,
                                           self.left, modality="v")
            else:
                self.ui.plot_latent_tracks(None, modality="v")

            if self.project.audio_enabled:
                self.ui.plot_latent_tracks(self.project.tracks[self.project.current_track_id], _dim_set,
                                           self.left, modality="a")
            else:
                self.ui.plot_latent_tracks(None, modality="a")

            if self.project.odor_enabled:
                self.ui.plot_latent_tracks(self.project.tracks[self.project.current_track_id], _dim_set,
                                           self.left, modality="o")
            else:
                self.ui.plot_latent_tracks(None, modality="o")

        self.update_latent_space_scatter()
        self.update_combination()

    def keyPressEvent(self, event: QKeyEvent):
        if event.key() == Qt.Key.Key_Left:
            self.left += 1
            self.update_latent_tracks()
        elif event.key() == Qt.Key.Key_Right:
            self.left -= 1
            self.update_latent_tracks()
        elif event.key() == Qt.Key.Key_Comma:
            self.switch_comb_pt_id(-1)
        elif event.key() == Qt.Key.Key_Period:
            self.switch_comb_pt_id(1)
        elif event.key() == Qt.Key.Key_0:
            self.insert_comb_pt()
        elif event.key() == Qt.Key.Key_Delete:
            self.remove_comb_pt()
        super().keyPressEvent(event)

    def insert_comb_pt(self):
        if self.project is not None:
            self.project.insert_comb_pt()
            self.update_combination()

    def remove_comb_pt(self):
        if self.project is not None:
            self.project.remove_comb_pt()
            self.update_combination()

    def switch_comb_pt_id(self, delta):
        if self.project is not None:
            if self.project.current_comb_pt_id is not None and self.project.current_track_id is not None and self.project.current_comb_id is not None:
                self.project.current_comb_pt_id += delta
                self.project.current_comb_pt_id = min(max(0, self.project.current_comb_pt_id), len(self.project.tracks[self.project.current_track_id].visual_combinations[self.project.current_comb_id])-1)

                self.ui.Vstrength.selected_dot_id = self.project.current_comb_pt_id
                self.ui.Astrength.selected_dot_id = self.project.current_comb_pt_id
                self.ui.Ostrength.selected_dot_id = self.project.current_comb_pt_id

                self.update_combination()

    def update_combination_spin(self):
        if self.project is not None and self.project.current_track_id is not None:
            _c_num = len(self.project.tracks[self.project.current_track_id].visual_combinations)
            if _c_num > 0:
                self.ui.weightSpin.setMaximum(_c_num-1)
                if self.project.current_comb_id is None:
                    self.project.current_comb_id = 0
                self.ui.weightSpin.setValue(self.project.current_comb_id)
                self.ui.weightSpin.setEnabled(True)
                self.ui.removeWeightButton.setEnabled(True)
            else:
                self.ui.weightSpin.setEnabled(False)
                self.ui.removeWeightButton.setEnabled(False)
        else:
            self.ui.weightSpin.setEnabled(False)
            self.ui.removeWeightButton.setEnabled(False)

    def edit_combination_point_visual(self):
        if self.combination_point_not_locked:
            self.project.edit_comb_pt(number_filter(self.ui.Vx.text()), "x", "v")
            self.project.edit_comb_pt(number_filter(self.ui.Vy.text()), "y", "v")
            self.update_combination()

    def edit_combination_point_audio(self):
        if self.combination_point_not_locked:
            self.project.edit_comb_pt(number_filter(self.ui.Ax.text()), "x", "a")
            self.project.edit_comb_pt(number_filter(self.ui.Ay.text()), "y", "a")
            self.update_combination()

    def edit_combination_point_odor(self):
        if self.combination_point_not_locked:
            self.project.edit_comb_pt(number_filter(self.ui.Ox.text()), "x", "o")
            self.project.edit_comb_pt(number_filter(self.ui.Oy.text()), "y", "o")
            self.update_combination()

    def update_combination(self):
        self.combination_point_not_locked = False
        self.update_combination_spin()

        if self.project is not None:
            self.ui.Vstrength.selected_dot_id = self.project.current_comb_pt_id
            self.ui.Astrength.selected_dot_id = self.project.current_comb_pt_id
            self.ui.Ostrength.selected_dot_id = self.project.current_comb_pt_id

        if self.project is not None and self.project.current_track_id is not None:
            if self.project.visual_enabled:
                self.ui.plot_weight(self.project.tracks[self.project.current_track_id], self.project.current_comb_id, "v")
            else:
                self.ui.plot_weight(None, None, "v")

            if self.project.audio_enabled:
                self.ui.plot_weight(self.project.tracks[self.project.current_track_id], self.project.current_comb_id, "a")
            else:
                self.ui.plot_weight(None, None, "a")

            if self.project.odor_enabled:
                self.ui.plot_weight(self.project.tracks[self.project.current_track_id], self.project.current_comb_id, "o")
            else:
                self.ui.plot_weight(None, None, "o")
        else:
            self.ui.plot_weight(None, None, "v")
            self.ui.plot_weight(None, None, "a")
            self.ui.plot_weight(None, None, "o")

        self.update_combination_pt()
        self.combination_point_not_locked = True

    def update_combination_pt(self):
        if self.project is not None and self.project.tracks is not None and self.project.current_comb_id is not None:
            if self.project.current_comb_pt_id is not None:
                if self.project.visual_enabled:
                    self.ui.Vx.setEnabled(True)
                    self.ui.Vy.setEnabled(True)
                    self.ui.Vx.setText(str(self.project.get_comb_coordinate("v", "x")))
                    self.ui.Vy.setText(str(self.project.get_comb_coordinate("v", "y")))
                else:
                    self.ui.Vx.setEnabled(False)
                    self.ui.Vy.setEnabled(False)

                if self.project.audio_enabled:
                    self.ui.Ax.setEnabled(True)
                    self.ui.Ay.setEnabled(True)
                    self.ui.Ax.setText(str(self.project.get_comb_coordinate("a", "x")))
                    self.ui.Ay.setText(str(self.project.get_comb_coordinate("a", "y")))
                else:
                    self.ui.Ax.setEnabled(False)
                    self.ui.Ay.setEnabled(False)

                if self.project.odor_enabled:
                    self.ui.Ox.setEnabled(True)
                    self.ui.Oy.setEnabled(True)
                    self.ui.Ox.setText(str(self.project.get_comb_coordinate("o", "x")))
                    self.ui.Oy.setText(str(self.project.get_comb_coordinate("o", "y")))
                else:
                    self.ui.Ox.setEnabled(False)
                    self.ui.Oy.setEnabled(False)

                return

        self.ui.Vx.setEnabled(False)
        self.ui.Vy.setEnabled(False)
        self.ui.Ax.setEnabled(False)
        self.ui.Ay.setEnabled(False)
        self.ui.Ox.setEnabled(False)
        self.ui.Oy.setEnabled(False)

    def add_combination(self):
        if self.project is not None and self.project.current_track_id is not None:
            self.project.add_combination()
            self.update_combination()

    def remove_combination(self):
        if self.project is not None and self.project.current_track_id is not None:
            self.project.remove_combination()
            self.update_combination()

    def add_track(self):
        self.project.add_track()
        self.toggle_spin_enabled()
        self.ui.trackIIDSpin.setValue(self.project.current_track_id)
        self.update_latent_tracks()
        self.update_point_coordinate()
        self.update_combination()

    def edit_point_visual(self):
        if self.track_point_not_locked:
            _d = self.get_dimension_set()
            if self.project is not None:
                _ui_text_boxes = [self.ui.Va, self.ui.Vb, self.ui.Vc, self.ui.Vd]
                for _dim_id in range(4):
                    if _d[_dim_id] is not None:
                        self.project.set_visual_value(_d[_dim_id], number_filter(_ui_text_boxes[_dim_id].text()))
                self.update_latent_tracks()

    def edit_point_audio(self):
        if self.track_point_not_locked:
            _d = self.get_dimension_set()
            if self.project is not None:
                _ui_text_boxes = [self.ui.Aa, self.ui.Ab, self.ui.Ac, self.ui.Ad]
                for _dim_id in range(4):
                    if _d[_dim_id] is not None:
                        self.project.set_audio_value(_d[_dim_id], number_filter(_ui_text_boxes[_dim_id].text()))
                self.update_latent_tracks()

    def edit_point_odor(self):
        if self.track_point_not_locked:
            _d = self.get_dimension_set()
            if self.project is not None:
                _ui_text_boxes = [self.ui.Oa, self.ui.Ob, self.ui.Oc, self.ui.Od]
                for _dim_id in range(4):
                    if _d[_dim_id] is not None:
                        self.project.set_odor_value(_d[_dim_id], number_filter(_ui_text_boxes[_dim_id].text()))
                self.update_latent_tracks()

    def remove_track(self):
        self.project.remove_track()
        if self.project.current_track_id is not None:
            self.ui.trackIIDSpin.setValue(self.project.current_track_id)
        self.update_latent_tracks()
        self.update_point_coordinate()
        self.toggle_spin_enabled()
        self.update_combination()

    def patch_insert(self, patch_id):
        self.project.add_point(patch_id)
        self.update_latent_tracks()
        self.update_point_coordinate()

    def patch_select(self, patch_id):
        if self.project is not None and self.project.current_track_id is not None:
            if patch_id < 0 or patch_id >= len(self.project.tracks[self.project.current_track_id].visual_pts):
                patch_id = None

            self.project.current_pt_id = patch_id
            self.ui.Vtrack.selected_patch = patch_id
            self.ui.Atrack.selected_patch = patch_id
            self.ui.Otrack.selected_patch = patch_id

        self.update_latent_tracks()
        self.update_point_coordinate()

    def patch_remove(self, patch_id):
        self.project.remove_point(patch_id)
        self.update_latent_tracks()
        self.update_point_coordinate()

    def update_point_coordinate(self):
        self.track_point_not_locked = False
        _d = self.get_dimension_set()
        _ui_text_boxes = {
            "v": [self.ui.Va, self.ui.Vb, self.ui.Vc, self.ui.Vd],
            "a": [self.ui.Aa, self.ui.Ab, self.ui.Ac, self.ui.Ad],
            "o": [self.ui.Oa, self.ui.Ob, self.ui.Oc, self.ui.Od]
        }

        if self.project is not None:
            if self.project.visual_enabled:
                for _dim_id in range(4):
                    _r = self.project.get_track_coordinate(_d[_dim_id], "v")
                    if _r is None:
                        _ui_text_boxes["v"][_dim_id].setEnabled(False)
                    else:
                        _ui_text_boxes["v"][_dim_id].setEnabled(True)
                        _ui_text_boxes["v"][_dim_id].setText(str(_r))
            else:
                for _dim_id in range(4):
                    _ui_text_boxes["v"][_dim_id].setEnabled(False)

            if self.project.audio_enabled:
                for _dim_id in range(4):
                    _r = self.project.get_track_coordinate(_d[_dim_id], "a")
                    if _r is None:
                        _ui_text_boxes["a"][_dim_id].setEnabled(False)
                    else:
                        _ui_text_boxes["a"][_dim_id].setEnabled(True)
                        _ui_text_boxes["a"][_dim_id].setText(str(_r))
            else:
                for _dim_id in range(4):
                    _ui_text_boxes["a"][_dim_id].setEnabled(False)

            if self.project.odor_enabled:
                for _dim_id in range(4):
                    _r = self.project.get_track_coordinate(_d[_dim_id], "o")
                    if _r is None:
                        _ui_text_boxes["o"][_dim_id].setEnabled(False)
                    else:
                        _ui_text_boxes["o"][_dim_id].setEnabled(True)
                        _ui_text_boxes["o"][_dim_id].setText(str(_r))
            else:
                for _dim_id in range(4):
                    _ui_text_boxes["o"][_dim_id].setEnabled(False)
        else:
            for _dim_id in range(4):
                _ui_text_boxes["v"][_dim_id].setEnabled(False)
                _ui_text_boxes["a"][_dim_id].setEnabled(False)
                _ui_text_boxes["o"][_dim_id].setEnabled(False)

        self.track_point_not_locked = True

