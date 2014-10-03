from pyramid.view import view_config
from pyramid.httpexceptions import HTTPNotFound
import h5py
import numpy as np


@view_config(route_name='dataset', renderer='json')
def get_dataset(request):
    json = request.json_body
    file_name = json["file_name"]
    dataset_name = json["dataset"]
    hdf5_file = h5py.File(file_name, "r")
    try:
        dataset = hdf5_file[dataset_name][...].tolist()
    except KeyError:
        raise HTTPNotFound(detail="dataset {0} not found in file {1}!".format(
                dataset_name, file_name))
    finally:
        hdf5_file.close()
    return dataset
