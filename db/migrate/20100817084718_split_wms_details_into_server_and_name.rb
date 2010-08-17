class SplitWmsDetailsIntoServerAndName < ActiveRecord::Migration
  def self.up
    rename_column :datasets, :wms, :wms_server
    add_column :datasets, :wms_name, :string
  end

  def self.down
    rename_column :datasets, :wms_server, :wms
    remove_column :datasets, :wms_name
  end
end
