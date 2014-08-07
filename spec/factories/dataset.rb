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
  end
end
