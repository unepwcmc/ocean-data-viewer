class CreateSiteLinks < ActiveRecord::Migration
  def self.up
    create_table :site_links do |t|
      t.string :title
      t.text :body
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :site_links
  end
end
