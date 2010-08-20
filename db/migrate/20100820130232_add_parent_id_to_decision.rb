class AddParentIdToDecision < ActiveRecord::Migration
  def self.up
    add_column :decisions, :parent_id, :integer
  end

  def self.down
    remove_column :decisions, :parent_id
  end
end
