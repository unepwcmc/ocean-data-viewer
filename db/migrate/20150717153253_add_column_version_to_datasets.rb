class AddColumnVersionToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :version, :string, default: 'NA'
  end
end
