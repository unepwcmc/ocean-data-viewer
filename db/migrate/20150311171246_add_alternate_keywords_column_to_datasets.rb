class AddAlternateKeywordsColumnToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :tags, :text, array: true, default: []
  end
end
