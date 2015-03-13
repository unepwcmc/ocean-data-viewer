FactoryGirl.define do
  factory :dataset do
    title 'awesome visualization'
    short_desc 'short_desc'
    long_desc 'long_desc'
    metadata_description 'metadata_description'
    wms_name 'simple name'
    wms_server 'http://www.example.com'
    wfs 'http://www.example.com'
    meta_download 'http://www.example.com'
    tags ['example', 'marine']
  end

  factory :observation_type do
    sequence(:name) { |n| "observation_type_#{n}" }
  end

  factory :data_format do
    sequence(:name) { |n| "format_#{n}" }
  end
end

