class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :institution
      t.text :intended_use
      t.boolean :licence_agreed, :default => false
      t.integer :licence_id
      t.integer :dataset_id

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
