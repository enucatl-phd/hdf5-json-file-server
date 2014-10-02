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
    it "raises not found error" do
      get(:show,
          {
          "file_name" => "/afs/psi.ch/project/hedpc/raw_data/2014/ccdfli/2014.09.09/S00000-00999/non-existent.hdf5",
          "dataset" => "raw_images/ccdimage_00007_00039_00.raw"
      },
          { "Accept" => "application/json" }
         )
      expect().to raise_error(ActionController::RoutingError)
    end
  end

end
