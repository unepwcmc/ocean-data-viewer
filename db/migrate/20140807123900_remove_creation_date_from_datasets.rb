class RemoveCreationDateFromDatasets < ActiveRecord::Migration
  def change
    remove_column :datasets, :creation_date, :datetime
  end
end
