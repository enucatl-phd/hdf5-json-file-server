class DatasetsController < ApplicationController
    respond_to :json

    def show
        puts params
        file = Hdf5::H5File.new(params[:file_name])
        dataset = file.dataset(params[:dataset])
        puts dataset
        puts dataset.narray_type
        narray = dataset.narray_all
        puts narray
        file.close
        respond_with narray
    end
end
