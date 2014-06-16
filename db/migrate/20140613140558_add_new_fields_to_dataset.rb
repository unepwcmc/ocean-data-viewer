class AddNewFieldsToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :creation_date, :datetime
    add_column :datasets, :format, :string
    add_column :datasets, :observation_type, :string
    add_column :datasets, :geographical_range, :string
  end
end
