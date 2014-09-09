class AddFactsheetUrlToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :factsheet_url, :string
  end
end
