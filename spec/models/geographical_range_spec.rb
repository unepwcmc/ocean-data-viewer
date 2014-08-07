require 'rails_helper'

describe GeographicalRange do
  describe "#all" do
    let (:result) { GeographicalRange.all }

    it "returns instances of GeographicalRange" do
      expect(result.first).to be_instance_of GeographicalRange
    end

    it "specific types" do
      expect(result.map(&:name)).to eq([ 'global', 'other' ])
    end
  end
end
