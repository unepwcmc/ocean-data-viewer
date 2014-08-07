class AddCreationDateToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :creation_date, :integer
  end
end
