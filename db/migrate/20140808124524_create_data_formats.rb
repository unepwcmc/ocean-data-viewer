class CreateDataFormats < ActiveRecord::Migration
  def change
    create_table :data_formats do |t|
      t.string :name

      t.timestamps
    end

    create_table :data_formats_datasets do |t|
      t.integer :dataset_id
      t.integer :data_format_id
    end
  end
end
