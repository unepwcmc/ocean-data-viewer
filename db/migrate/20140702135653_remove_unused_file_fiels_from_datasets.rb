class RemoveUnusedFileFielsFromDatasets < ActiveRecord::Migration
  def change
    remove_column :datasets, :html_file_name, :string
    remove_column :datasets, :html_content_type, :string
    remove_column :datasets, :html_file_size, :integer
    remove_column :datasets, :html_updated_at, :datetime

    remove_column :datasets, :xml_file_name, :string
    remove_column :datasets, :xml_content_type, :string
    remove_column :datasets, :xml_file_size, :integer
    remove_column :datasets, :xml_updated_at, :datetime
  end
end
