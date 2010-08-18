class CreateDatasetsDecisionsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :datasets_decisions do |t|
      t.integer :dataset_id
      t.integer :descision_id
      t.integer :category_id
    end
  end

  def self.down
    drop_table :datasets_descisions
  end
end
