class AddStylesAndViewParamsToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :styles, :string
    add_column :datasets, :view_params, :string
  end
end
