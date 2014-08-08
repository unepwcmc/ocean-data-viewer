class RemoveFormatFromDatasets < ActiveRecord::Migration
  def change
    remove_column :datasets, :format, :string
  end
end
