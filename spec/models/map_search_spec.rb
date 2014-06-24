require 'rails_helper'

describe MapSearch do

  describe "validate sort options" do
    it 'should be not valid when it is a random value' do
      expect(MapSearch.new(sort_by: 'something').valid?).to eq(false)
    end

    it 'should be valid when one of the valid values' do
      MapSearch::SORT_BY_OPTIONS.each do |a_valid_value|
        expect(MapSearch.new(sort_by: a_valid_value).valid?).to eq(true)
      end
    end
  end

  it 'validates formats' do
    expect(MapSearch.new(sort_by: 'creation_date', formats: ['blue']).valid?).to eq(false)
    expect(MapSearch.new(sort_by: 'creation_date', formats: ['polygon']).valid?).to eq(true)
  end

  it 'validates observation_types' do
    expect(MapSearch.new(sort_by: 'creation_date', observation_types: ['red']).valid?).to eq(false)
    expect(MapSearch.new(sort_by: 'creation_date', observation_types: ['modelled']).valid?).to eq(true)
  end

  it 'validates geographical_ranges' do
    expect(MapSearch.new(sort_by: 'creation_date', geographical_ranges: ['green']).valid?).to eq(false)
    expect(MapSearch.new(sort_by: 'creation_date', geographical_ranges: ['global', 'regional']).valid?).to eq(true)
  end

  describe "#advanced_search?" do
    let (:advanced_search) {
      MapSearch.new(sort_by: :creation_date, observation_types: ['empirical']) }

    let (:non_advanced_search) { MapSearch.new(sort_by: :creation_date) }

    it 'should be an advanced search' do
      expect(advanced_search.advanced_search?).to eq(true)
    end

    it 'should not be an advanced search' do
      expect(non_advanced_search.advanced_search?).to eq(false)
    end
  end
end
