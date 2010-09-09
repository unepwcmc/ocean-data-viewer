class AddOrderIntToDecisionAndDataset < ActiveRecord::Migration
  def self.up
    add_column :datasets, :order_number, :integer
    add_column :decisions, :order_number, :integer
  end

  def self.down
    remove_column :datasets, :order_number
    remove_column :decisions, :order_number
  end
end
