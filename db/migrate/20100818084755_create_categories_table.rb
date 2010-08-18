class CreateCategoriesTable < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.text :identifier
      t.text :short_desc
      t.text :description
      
      t.integer :decision_id

      t.timestamps
    end
  end

  def self.down
    drop_table :decisions
  end
end
