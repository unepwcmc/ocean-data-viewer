class AddFieldsToDataset < ActiveRecord::Migration
  def self.up
    add_column :datasets, :html_file_name,    :string
    add_column :datasets, :html_content_type, :string
    add_column :datasets, :html_file_size,    :integer
    add_column :datasets, :html_updated_at,   :datetime

    add_column :datasets, :xml_file_name,    :string
    add_column :datasets, :xml_content_type, :string
    add_column :datasets, :xml_file_size,    :integer
    add_column :datasets, :xml_updated_at,   :datetime
  end

  def self.down
    remove_column :datasets, :html_file_name
    remove_column :datasets, :html_content_type
    remove_column :datasets, :html_file_size
    remove_column :datasets, :html_updated_at

    remove_column :datasets, :xml_file_name
    remove_column :datasets, :xml_content_type
    remove_column :datasets, :xml_file_size
    remove_column :datasets, :xml_updated_at
    
  end
end
