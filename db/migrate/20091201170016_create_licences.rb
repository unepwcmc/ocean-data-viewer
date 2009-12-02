class CreateLicences < ActiveRecord::Migration
  def self.up
    create_table :licences do |t|
      t.string :title
      t.text :short_desc
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :licences
  end
end
