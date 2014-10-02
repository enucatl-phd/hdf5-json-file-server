class DatasetsController < ApplicationController
    respond_to :json

    def show
        puts params
        begin
          file = Hdf5::H5File.new(params[:file_name])
        rescue Errno::ENOENT
          not_found
        end
        dataset = file.dataset(params[:dataset]).narray_all
        file.close
        p dataset.to_json
        respond_with dataset
    end
end
