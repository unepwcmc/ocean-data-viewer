class AddMissingFieldsToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :time_range_start, :integer
    add_column :datasets, :time_range_end, :integer
    add_column :datasets, :data_provider, :string
  end
end
