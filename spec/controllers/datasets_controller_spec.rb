require 'rails_helper'

RSpec.describe DatasetsController, :type => :controller do

  describe "GET show" do
    it "returns http success" do
      get(:show,
          {
          "file_name" => "/afs/psi.ch/project/hedpc/raw_data/2014/ccdfli/2014.09.09/S00000-00999/S00007.hdf5",
          "dataset" => "raw_images/ccdimage_00007_00039_00.raw"
      },
          { "Accept" => "application/json" }
         )
      expect(response).to be_success
    end
    it "returns http 404" do
      get(:show,
          {
          "file_name" => "/afs/psi.ch/project/hedpc/raw_data/2014/ccdfli/2014.09.09/S00000-00999/non-existent.hdf5",
          "dataset" => "raw_images/ccdimage_00007_00039_00.raw"
      },
          { "Accept" => "application/json" }
         )
      expect(response.status).to eq(404)
    end
  end

end
