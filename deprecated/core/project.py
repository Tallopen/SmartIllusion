import pickle

from core.latent import LatentSpace

import scipy.io as scio

import tensorflow as tf
import tensorflow.keras as keras
import os

os.environ["CUDA_VISIBLE_DEVICES"] = "-1"


class Track:

    def __init__(self, visual_dim=4, audio_dim=4, odor_dim=4):

        self.visual_combinations = []
        self.audio_combinations = []
        self.odor_combinations = []

        self.visual_pts = [[0 for _ in range(visual_dim)]]
        self.audio_pts = [[0 for _ in range(audio_dim)]]
        self.odor_pts = [[0 for _ in range(odor_dim)]]

        self.visual_dim = visual_dim
        self.audio_dim = audio_dim
        self.odor_dim = odor_dim

        self.comb_mod = {
            "v": self.visual_combinations,
            "a": self.audio_combinations,
            "o": self.odor_combinations
        }

    def new_combination(self):
        self.visual_combinations.append([[0, 1], [1, 1]])
        self.audio_combinations.append([[0, 1], [1, 1]])
        self.odor_combinations.append([[0, 1], [1, 1]])

        self.comb_mod = {
            "v": self.visual_combinations,
            "a": self.audio_combinations,
            "o": self.odor_combinations
        }

    def delete_combination(self, __index):
        self.visual_combinations.pop(__index)
        self.audio_combinations.pop(__index)
        self.odor_combinations.pop(__index)

    def add_comb_pt(self, comb_id, pt_index):
        if pt_index < len(self.visual_combinations[comb_id])-1:
            self.visual_combinations[comb_id].insert(pt_index + 1, [(self.visual_combinations[comb_id][pt_index][0] + self.visual_combinations[comb_id][pt_index + 1][0]) / 2,
                                                                    (self.visual_combinations[comb_id][pt_index][0] + self.visual_combinations[comb_id][pt_index + 1][0]) / 2])
            self.audio_combinations[comb_id].insert(pt_index + 1, [(self.audio_combinations[comb_id][pt_index][0] + self.audio_combinations[comb_id][pt_index + 1][0]) / 2,
                                                                   (self.audio_combinations[comb_id][pt_index][0] + self.audio_combinations[comb_id][pt_index + 1][0]) / 2])
            self.odor_combinations[comb_id].insert(pt_index + 1, [(self.odor_combinations[comb_id][pt_index][0] + self.odor_combinations[comb_id][pt_index + 1][0]) / 2,
                                                                  (self.odor_combinations[comb_id][pt_index][0] + self.odor_combinations[comb_id][pt_index + 1][0]) / 2])

    def remove_comb_pt(self, comb_id, pt_id):
        if 0 < pt_id < len(self.visual_combinations[comb_id])-1:
            self.visual_combinations[comb_id].pop(pt_id)
            self.audio_combinations[comb_id].pop(pt_id)
            self.odor_combinations[comb_id].pop(pt_id)

    def edit_comb_pt(self, comb_id, pt_id, modality, value, _dim):
        _c = self.comb_mod[modality]
        _c[comb_id][pt_id][0 if _dim == 'x' else 1] = value

    def insert_pt(self, __index=0):
        self.visual_pts.insert(__index, [0 for _ in range(self.visual_dim)])
        self.audio_pts.insert(__index, [0 for _ in range(self.audio_dim)])
        self.odor_pts.insert(__index, [0 for _ in range(self.odor_dim)])

    def delete_pt(self, __index=0):
        self.visual_pts.pop(__index)
        self.audio_pts.pop(__index)
        self.odor_pts.pop(__index)

    def serialize(self):
        return {
            "visual_combinations": self.visual_combinations,
            "audio_combinations": self.audio_combinations,
            "odor_combinations": self.odor_combinations,

            "visual_pts": self.visual_pts,
            "audio_pts": self.audio_pts,
            "odor_pts": self.odor_pts,

            "visual_dim": self.visual_dim,
            "audio_dim": self.audio_dim,
            "odor_dim": self.odor_dim
        }

    def parse(self, data: dict):
        self.visual_combinations = data["visual_combinations"]
        self.audio_combinations = data["audio_combinations"]
        self.odor_combinations = data["odor_combinations"]

        self.visual_pts = data["visual_pts"]
        self.audio_pts = data["audio_pts"]
        self.odor_pts = data["odor_pts"]

        self.visual_dim = data["visual_dim"]
        self.audio_dim = data["audio_dim"]
        self.odor_dim = data["odor_dim"]


class Project:

    def __init__(self, visual_latent_path=None, audio_latent_path=None, odor_latent_dim=4):

        self.tracks = []

        self.visual_enabled = False
        self.visual_latent_path = None
        self.visual_latent_space = None
        self.visual_autoencoder_path = None
        self.visual_autoencoder = None
        self.enable_visual_upscaler = False
        self.visual_upscaler_path = None
        self.visual_upscaler = None
        self.visual_dim = 4

        if visual_latent_path is not None:
            self.load_visual_latent_space(visual_latent_path)

        self.audio_enabled = False
        self.audio_latent_path = None
        self.audio_latent_space = None
        self.audio_compressor_path = None
        self.audio_compressor = None
        self.audio_dim = 4

        if audio_latent_path is not None:
            self.load_audio_latent_space(audio_latent_path)

        self.odor_enabled = False
        self.odor_dim = odor_latent_dim

        # properties for editors
        self.current_track_id = None
        self.current_pt_id = None
        self.current_comb_id = None
        self.current_comb_pt_id = None

    def load_visual_ae(self, path):
        self.visual_autoencoder = keras.models.load_model(path)
        self.visual_autoencoder_path = path

    def load_visual_upscaler(self, path):
        self.visual_upscaler = keras.models.load_model(path)
        self.visual_upscaler_path = path
        self.enable_visual_upscaler = True

    def load_audio_compressor(self, path):
        self.audio_compressor = keras.models.load_model(path)
        self.audio_compressor_path = path

    def load_visual_latent_space(self, path):
        self.visual_latent_path = path
        latent_contents = scio.loadmat(self.visual_latent_path)
        self.visual_latent_space = LatentSpace(latent_contents['latent'], latent_contents['physics'])
        self.visual_enabled = True
        self.visual_dim = latent_contents['latent'].shape[1]

    def load_audio_latent_space(self, path):
        self.audio_latent_path = path
        latent_contents = scio.loadmat(self.audio_latent_path)
        self.audio_latent_space = LatentSpace(latent_contents['specCompressions'], latent_contents['labels'])
        self.audio_enabled = True
        self.audio_dim = latent_contents['specCompressions'].shape[1]

    def add_track(self):
        self.tracks.append(Track(self.visual_dim, self.audio_dim, self.odor_dim))
        self.current_track_id = len(self.tracks)-1
        self.current_pt_id = 0

    def remove_track(self):
        try:
            self.tracks.pop(self.current_track_id)
            if self.current_track_id >= len(self.tracks):
                self.current_track_id = len(self.tracks) - 1
            if len(self.tracks) == 0:
                self.current_track_id = None
            self.current_pt_id = 0
        except IndexError:
            pass

    def add_point(self, point_id):
        try:
            self.tracks[self.current_track_id].insert_pt(point_id)
            self.current_pt_id = point_id
        except IndexError:
            pass

    def remove_point(self, point_id):
        try:
            self.tracks[self.current_track_id].delete_pt(point_id)
            self.current_pt_id = point_id if point_id < len(self.tracks[self.current_track_id].visual_pts) else None
        except IndexError:
            pass

    def set_visual_value(self, dim, new_value):
        try:
            self.tracks[self.current_track_id].visual_pts[self.current_pt_id][dim-1] = new_value
        except IndexError:
            pass

    def set_audio_value(self, dim, new_value):
        try:
            self.tracks[self.current_track_id].audio_pts[self.current_pt_id][dim-1] = new_value
        except IndexError:
            pass

    def set_odor_value(self, dim, new_value):
        try:
            self.tracks[self.current_track_id].odor_pts[self.current_pt_id][dim-1] = new_value
        except IndexError:
            pass

    def set_properties(self, _p):
        if _p[0]:
            self.visual_enabled = _p[0]["visual_enabled"]
            self.visual_autoencoder_path = _p[0]["visual_autoencoder_path"]
            self.enable_visual_upscaler = _p[0]["visual_upscaler_enabled"]
            self.visual_upscaler_path = _p[0]["visual_upscaler_path"]
            self.visual_latent_path = _p[0]["visual_latent_path"]

            self.audio_enabled = _p[0]["audio_enabled"]
            self.audio_compressor_path = _p[0]["audio_compressor_path"]
            self.audio_latent_path = _p[0]["audio_latent_path"]

            self.odor_enabled = _p[0]["odor_enabled"]
            self.odor_dim = _p[0]["odor_dim"]

        if self.visual_enabled:
            if self.visual_autoencoder_path:
                self.load_visual_ae(self.visual_autoencoder_path)

            if self.enable_visual_upscaler and self.visual_upscaler_path:
                self.load_visual_upscaler(self.visual_upscaler_path)

            if self.visual_latent_path:
                self.load_visual_latent_space(self.visual_latent_path)

        if self.audio_enabled:
            if self.audio_compressor_path:
                self.load_audio_compressor(self.audio_compressor_path)

            if self.audio_latent_path:
                self.load_audio_latent_space(self.audio_latent_path)

    def get_track_coordinate(self, _dim, modality="v"):
        if _dim:
            if self.current_track_id is not None and self.current_pt_id is not None:
                _t = {
                    "v": self.tracks[self.current_track_id].visual_pts,
                    "a": self.tracks[self.current_track_id].audio_pts,
                    "o": self.tracks[self.current_track_id].odor_pts,
                }[modality]
                if len(_t) > self.current_pt_id and len(_t[0]) >= _dim:
                    return _t[self.current_pt_id][_dim-1]
                else:
                    return None
        return None

    def get_comb_coordinate(self, modality="v", dim="x"):
        if self.current_track_id is not None and self.current_comb_id is not None and self.current_comb_pt_id is not None:
            return self.tracks[self.current_track_id].comb_mod[modality][self.current_comb_id][self.current_comb_pt_id][0 if dim=='x' else 1]

    def add_combination(self):
        if self.current_track_id is not None:
            self.tracks[self.current_track_id].new_combination()
            self.current_comb_id = len(self.tracks[self.current_track_id].visual_combinations) - 1
            self.current_comb_pt_id = 0

    def remove_combination(self):
        if self.current_comb_id is not None and self.current_track_id is not None:
            self.tracks[self.current_track_id].delete_combination(self.current_comb_id)
            if len(self.tracks[self.current_track_id].visual_combinations):
                self.current_comb_id = min(self.current_comb_id, len(self.tracks[self.current_track_id].visual_combinations) - 1)
                self.current_comb_pt_id = 0
            else:
                self.current_comb_id = None
                self.current_comb_pt_id = None

    def insert_comb_pt(self):
        if self.current_track_id is not None and self.current_comb_id is not None and self.current_comb_pt_id is not None:
            self.tracks[self.current_track_id].add_comb_pt(self.current_comb_id, self.current_comb_pt_id)

    def remove_comb_pt(self):
        if self.current_track_id is not None and self.current_comb_id is not None and self.current_comb_pt_id:
            if self.current_pt_id != len(self.tracks[self.current_track_id].visual_combinations[self.current_comb_id]) - 1:
                self.tracks[self.current_track_id].remove_comb_pt(self.current_comb_id, self.current_comb_pt_id)

    def edit_comb_pt(self, _value, dim="x", modality="v"):
        if self.current_track_id is not None and self.current_comb_id is not None and self.current_comb_pt_id is not None:
            self.tracks[self.current_track_id].edit_comb_pt(self.current_comb_id, self.current_comb_pt_id, modality, _value, dim)

    def modality_infer(self, position):
        # position should be between 0 and 1
        if self.current_track_id is not None:
            if self.visual_enabled and self.visual_latent_space is not None:
                visual_track_len = self.visual_latent_space.get_track_length(self.tracks[self.current_track_id].visual_pts)
            else:
                visual_track_len = 0

            if self.audio_enabled and self.audio_latent_space is not None:
                audio_track_len = self.audio_latent_space.get_track_length(self.tracks[self.current_track_id].audio_pts)
            else:
                audio_track_len = 0

    def serialize(self, path):
        _tracks = []
        for t in self.tracks:
            _tracks.append(t.serialize())

        _d = {
            "visual_enabled": self.visual_enabled,
            "visual_latent_path": self.visual_latent_path,
            "visual_latent_space": self.visual_latent_space,
            "visual_autoencoder_path": self.visual_autoencoder_path,
            "visual_autoencoder": self.visual_autoencoder,
            "enable_visual_upscaler": self.enable_visual_upscaler,
            "visual_upscaler_path": self.visual_upscaler_path,
            "visual_upscaler": self.visual_upscaler,
            "visual_dim": self.visual_dim,

            "audio_enabled": self.audio_enabled,
            "audio_latent_path": self.audio_latent_path,
            "audio_latent_space": self.audio_latent_space,
            "audio_compressor_path": self.audio_compressor_path,
            "audio_compressor": self.audio_compressor,
            "audio_dim": self.audio_dim,

            "odor_enabled": self.odor_enabled,
            "odor_dim": self.odor_dim,

            "tracks": _tracks
        }

        with open(path, "wb") as f:
            pickle.dump(_d, f)

    def load_from(self, path):
        with open(path, "rb") as f:
            _d = pickle.load(f)

        self.visual_enabled = _d["visual_enabled"]
        self.visual_latent_path = _d["visual_latent_path"]
        self.visual_latent_space = _d["visual_latent_space"]
        self.visual_autoencoder_path = _d["visual_autoencoder_path"]
        self.visual_autoencoder = _d["visual_autoencoder"]
        self.enable_visual_upscaler = _d["enable_visual_upscaler"]
        self.visual_upscaler_path = _d["visual_upscaler_path"]
        self.visual_upscaler = _d["visual_upscaler"]
        self.visual_dim = _d["visual_dim"]

        self.audio_enabled = _d["audio_enabled"]
        self.audio_latent_path = _d["audio_latent_path"]
        self.audio_latent_space = _d["audio_latent_space"]
        self.audio_compressor_path = _d["audio_compressor_path"]
        self.audio_compressor = _d["audio_compressor"]
        self.audio_dim = _d["audio_dim"]

        self.odor_enabled = _d["odor_enabled"]
        self.odor_dim = _d["odor_dim"]

        self.tracks = []

        for _t in _d["tracks"]:
            _ot = Track()
            _ot.parse(_t)
            self.tracks.append(_ot)
