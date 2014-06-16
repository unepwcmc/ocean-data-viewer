class CreateDataCategories < ActiveRecord::Migration
  def change
    create_table :data_categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :data_categories_datasets do |t|
      t.integer :dataset_id
      t.integer :data_category_id
    end
  end
end
