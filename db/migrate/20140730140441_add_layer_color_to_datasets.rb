class AddLayerColorToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :layer_color, :string
  end
end
