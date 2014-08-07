class CreateObservationTypes < ActiveRecord::Migration
  def change
    create_table :observation_types do |t|
      t.string :name

      t.timestamps
    end

    create_table :datasets_observation_types do |t|
      t.integer :dataset_id
      t.integer :observation_type_id
    end
  end
end
