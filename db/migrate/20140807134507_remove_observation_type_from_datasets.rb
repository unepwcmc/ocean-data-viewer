class RemoveObservationTypeFromDatasets < ActiveRecord::Migration
  def change
    remove_column :datasets, :observation_type, :string
  end
end
