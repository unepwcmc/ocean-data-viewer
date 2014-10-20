# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[ 'Biogenetic',
  'Biodiversity Metric',
  'Biogeographic',
  'Species Distribuition',
  'Areas of Biodiversity Importance',
  'Environment Descriptor',
  'Ecological Status Administration',
  'Species Habitat'
  ].each do |name|

  DataCategory.find_or_create_by(name: name)
end

[ 'Empirical observation',
  'Model',
  'Metric',
  'Classification',
  'Other'
  ].each do |name|
  ObservationType.find_or_create_by(name: name)
end

[ 'point',
  'polygon',
  'raster',
  'other'
  ].each do |name|
  DataFormat.find_or_create_by(name: name)
end
