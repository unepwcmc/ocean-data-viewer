require 'rails_helper'

describe MapSearchService do
  let (:licence) { create(:licence) }
  let (:datasets_repository) { Dataset }

  before do
    create(:dataset, title: 'b', format: 'point', observation_type: 'modeled')
    create(:dataset, title: 'c', format: 'polygon', observation_type: 'empirical')
    create(:dataset, title: 'a', format: 'point', observation_type: 'empirical')
  end

  it 'orders the datasets' do
    search = MapSearch.new(sort_by: 'title')
    expect(MapSearchService.new(datasets_repository).query(search).first.title).to eq('a')
  end

  it 'search by formats' do
    search = MapSearch.new(sort_by: 'title', formats: ['polygon'])
    expect(MapSearchService.new(datasets_repository).query(search).first.title).to eq('c')
  end

  it 'search by observation_types' do
    search = MapSearch.new(sort_by: 'title', observation_types: ['modeled'])
    expect(MapSearchService.new(datasets_repository).query(search).first.title).to eq('b')
  end
end
