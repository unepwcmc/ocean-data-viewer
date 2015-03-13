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

  it 'validates sorting' do
    expect(MapSearch.new(sort_by: 'something').valid?).to eq(false)
    expect(MapSearch.new(sort_by: 'creation_date DESC').valid?).to eq(true)
  end

  it 'validates geographical_ranges' do
    expect(MapSearch.new(sort_by: 'creation_date DESC', geographical_ranges: ['green']).valid?).to eq(false)
    expect(MapSearch.new(sort_by: 'creation_date DESC', geographical_ranges: ['global', 'other']).valid?).to eq(true)
  end

  it 'validates search by text' do
    expect(MapSearch.new(sort_by: 'creation_date DESC', text_search: 'global').valid?).to eq(true)
  end

  describe "#advanced_search?" do
    let (:advanced_search) {
      MapSearch.new(sort_by: 'creation_date DESC', observation_types: ['empirical']) }

    let (:non_advanced_search) { MapSearch.new(sort_by: 'creation_date DESC') }

    it 'should be an advanced search' do
      expect(advanced_search.advanced_search?).to eq(true)
    end

    it 'should not be an advanced search' do
      expect(non_advanced_search.advanced_search?).to eq(false)
    end
  end
end
