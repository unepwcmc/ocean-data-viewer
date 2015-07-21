require 'rails_helper'
require 'spec_helper'

describe Admin::DatasetsController do

  before do
    login
    @dataset = FactoryGirl.create(:dataset)
  end

  describe "#index" do
    subject { get :index }
    it { is_expected.to be_successful }
  end

  describe "#create" do
    let(:attributes) do
      {
        title: 'title',
        short_desc: 'short',
        long_desc: 'long',
        metadata_description: 'metadata',
        wms_name: 'wms_name',
        wms_server: 'http://wms.server.com'
      }
    end

    subject { post :create, dataset: attributes }

    it "should create and save dataset" do
      expect{subject}.to change(Dataset, :count).by(1)
    end

    it "should redirect to show" do
      expect(subject).to redirect_to([:admin, assigns(:dataset)])
    end
  end

  describe "#update" do
    let(:attributes) { { version: '1.1' } }

    before :each do
      put :update, id: @dataset.id, dataset: attributes
      @dataset.reload
    end

    it "should redirect to dataset show page" do
      expect(response).to redirect_to([:admin, @dataset])
    end

    it "should update dataset version" do
      expect(@dataset.version).to eql attributes[:version]
    end
  end

  describe "#destroy" do
    subject { delete :destroy, id: @dataset.id}

    it "should destroy dataset" do
      expect{subject}.to change(Dataset, :count).by(-1)
    end
  end
end
