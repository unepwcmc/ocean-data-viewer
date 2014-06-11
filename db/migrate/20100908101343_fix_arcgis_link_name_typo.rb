class FixArcgisLinkNameTypo < ActiveRecord::Migration
  def self.up
    rename_column :datasets, :argis_link, :arcgis_link
  end

  def self.down
    rename_column :datasets, :arcgis_link, :argis_link 
  end
end
