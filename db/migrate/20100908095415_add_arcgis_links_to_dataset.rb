class AddArcgisLinksToDataset < ActiveRecord::Migration
  def self.up
    add_column :datasets, :argis_link, :string
  end

  def self.down
    remove_column :datasets, :argis_link
  end
end
