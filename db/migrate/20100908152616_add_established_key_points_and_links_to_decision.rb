class AddEstablishedKeyPointsAndLinksToDecision < ActiveRecord::Migration
  def self.up
    add_column :decisions, :established, :text
    add_column :decisions, :key_points, :text
    add_column :decisions, :links, :text
  end

  def self.down
    remove_column :decisions, :established
    remove_column :decisions, :key_points
    remove_column :decisions, :links
  end
end
