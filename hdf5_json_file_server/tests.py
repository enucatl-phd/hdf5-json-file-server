import unittest
import h5py

from pyramid import testing


class ViewTests(unittest.TestCase):
    def setUp(self):
        self.config = testing.setUp()

    def tearDown(self):
        testing.tearDown()

    def test_get_dataset(self):
        from .views import get_dataset
        request = testing.DummyRequest()
        request.json_body = {
            "file_name": "/afs/psi.ch/project/hedpc/raw_data/2014/ccdfli/2014.09.09/S00000-00999/S00007.hdf5",
            "dataset": "/raw_images/ccdimage_00007_00033_00.raw",
        }
        dataset_json = get_dataset(request)
        self.assertEqual(
            h5py.File(request.json_body["file_name"])[
                request.json_body["dataset"]
            ][...].tolist(),
            dataset_json)
