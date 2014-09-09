require 'rails_helper'

describe MapSearchService do
  let(:datasets_repository) { Dataset }
  let(:modelled_type) { create(:observation_type, name: 'modelled') }
  let(:empirical_type) { create(:observation_type, name: 'empirical') }
  let(:point) { create(:data_format, name: 'point') }
  let(:polygon) { create(:data_format, name: 'polygon') }

  before do
    create(:dataset, title: 'b', data_formats: [point], observation_types: [modelled_type], geographical_range: 'other')
    create(:dataset, title: 'c', data_formats: [polygon], observation_types: [empirical_type], geographical_range: 'global')
    create(:dataset, title: 'a', data_formats: [point], observation_types: [empirical_type], geographical_range: 'global')
  end

  it 'orders the datasets' do
    search = MapSearch.new(sort_by: 'title')
    expect(MapSearchService.new(datasets_repository).query(search).first.title).to eq('a')
  end

  it 'search by formats' do
    search = MapSearch.new(sort_by: 'title', formats: [polygon.id])
    expect(MapSearchService.new(datasets_repository).query(search).first.title).to eq('c')
  end

  it 'search by observation_types' do
    search = MapSearch.new(sort_by: 'title', observation_types: [modelled_type.id])
    expect(MapSearchService.new(datasets_repository).query(search).first.title).to eq('b')
  end

  it 'search by geographical_ranges' do
    search = MapSearch.new(sort_by: 'title', geographical_ranges: ['other'])
    expect(MapSearchService.new(datasets_repository).query(search).first.title).to eq('b')
  end
end
