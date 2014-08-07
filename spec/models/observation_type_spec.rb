require 'rails_helper'

describe ObservationType do
  describe "#all" do
    let (:result) { ObservationType.all }

    it "returns instances of ObservationType" do
      expect(result.first).to be_instance_of ObservationType
    end

    it "specific types" do
      expect(result.map(&:name)).to eq([ 'empirical', 'modelled', 'metric', 'classification' ])
    end
  end
end
