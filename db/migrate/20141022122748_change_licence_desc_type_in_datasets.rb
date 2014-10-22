class ChangeLicenceDescTypeInDatasets < ActiveRecord::Migration
  def self.up
    change_column :datasets, :licence_desc, :text
  end

  def self.down
    change_column :datasets, :licence_desc, :string
  end
end
