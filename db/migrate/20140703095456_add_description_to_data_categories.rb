class AddDescriptionToDataCategories < ActiveRecord::Migration
  def change
    add_column :data_categories, :description, :text
  end
end
