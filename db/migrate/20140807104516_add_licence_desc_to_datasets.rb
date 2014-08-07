class AddLicenceDescToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :licence_desc, :string
  end
end
