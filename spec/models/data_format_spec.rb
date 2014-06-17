require 'rails_helper'

describe DataFormat do
  describe "#all" do
    let (:result) { DataFormat.all }

    it "returns instances of DataFormat" do
      expect(result.first).to be_instance_of DataFormat
    end

    it "specific types" do
      expect(result.map(&:name)).to eq([ 'point', 'polygon', 'point & polygon', 'raster' ])
    end
  end
end
