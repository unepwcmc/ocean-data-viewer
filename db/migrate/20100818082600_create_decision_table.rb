class CreateDecisionTable < ActiveRecord::Migration
  def self.up
    create_table :decisions do |t|
      t.string :name
      t.text :short_name
      t.text :short_desc
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :decisions
  end
end
