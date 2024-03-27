import numpy as np
from scipy.interpolate import LinearNDInterpolator, NearestNDInterpolator
from collections import Counter


class LatentSpace:

    def __init__(self, latent_samples, physics, EPSI=100):
        # latent samples: 2D numpy array, sample number * latent dimension number
        # physics: 2D numpy array. sample number * physical variable number

        self.latent = latent_samples
        self.physics = physics
        self.construct_metric_interpolator()
        self.EPSI = EPSI

    def get_range(self):
        return np.min(np.min(self.latent)), np.max(np.max(self.latent))

    def construct_metric_interpolator(self):
        vr_id = self.physics[:, 0]

        _c = Counter(vr_id)

        _d = []
        _l = []
        for _id in _c.keys():
            latent_p = self.latent[vr_id == _id, :]
            vr_p = self.physics[vr_id == _id, 1]

            for p_id in range(vr_p.shape[0] - 1):
                if np.sum((latent_p[p_id, :] - latent_p[p_id + 1, :]) ** 2) > 0:
                    _d.append((vr_p[p_id + 1] - vr_p[p_id]) / np.sqrt(np.sum((latent_p[p_id, :] - latent_p[p_id + 1, :]) ** 2)))
                    _l.append((latent_p[p_id, :] + latent_p[p_id + 1, :]) / 2)

        self.nndi = NearestNDInterpolator(_l, _d)
        self.lndi = LinearNDInterpolator(_l, _d)

    def get_metric(self, args):
        lni = self.lndi(*args)
        if np.isnan(lni) or lni is None:
            return self.nndi(*args)
        return lni

    @staticmethod
    def find_position(start_pt, end_pt, num_of_dissection, dissection_index):
        return tuple([start_pt[i]*(1-(dissection_index+1/2)/num_of_dissection) + end_pt[i]*(dissection_index+1/2)/num_of_dissection for i in range(len(start_pt))])

    def find_length(self, start_pt, end_pt):
        # this code finds Riemannian distance along a Euclidean straight line, from start_pt to end_pt

        _l = np.sqrt(np.sum((np.array(end_pt) - np.array(start_pt))**2))
        _n = int(self.EPSI * _l) + 1
        _delta_s = _l / _n

        _length = 0
        for j in range(_n):
            _length += self.get_metric(self.find_position(start_pt, end_pt, _n, j)) * _delta_s

        return _length

    def get_track_length(self, pts):
        # given a series of points in latent space, this code finds the Riemannian length of the Euclidean lines
        # connecting these points consecutively
        track_length = 0

        pt_num = len(pts)
        for seg_id in range(pt_num-1):
            track_length += self.find_length(pts[seg_id], pts[seg_id+1])

        return track_length

    def find_latent_position_given_track_position(self, track_position, pts):
        # track_position in [0,1]
        # pts is a series of coordinates: [pt1, pt2, ..., ptn], where pt1 is [coor1, coor2, ..., coor(num of dim)]
        track_length = self.get_track_length(pts)
        track_position = track_length * track_position

        track_length = 0
        seg_position = 0
        seg_id = 0

        for seg_id in range(len(pts)-1):
            acc_l = track_length + self.find_length(pts[seg_id], pts[seg_id+1])
            if acc_l > track_position:
                seg_position = track_position - track_length
                break
            track_length = acc_l

        start_pt = pts[seg_id]
        end_pt = pts[seg_id+1]

        _l = np.sqrt(np.sum((np.array(end_pt) - np.array(start_pt)) ** 2))
        _n = int(self.EPSI * _l) + 1
        _delta_s = _l / _n

        _length = 0
        for j in range(_n):
            latent_position = self.find_position(start_pt, end_pt, _n, j)
            _length += self.get_metric(latent_position) * _delta_s
            if seg_position <= _length:
                return latent_position

        return None

    def generate(self, track, resolution, model):
        pass
