class CreateDatasets < ActiveRecord::Migration
  def self.up
    create_table :datasets do |t|
      t.string :title
      t.text :short_desc
      t.text :long_desc
      t.text :metadata_description
      t.string :shp_download
      t.string :wms
      t.string :wfs
      t.string :meta_download
      t.integer :licence_id

      t.timestamps
    end
  end

  def self.down
    drop_table :datasets
  end
end
