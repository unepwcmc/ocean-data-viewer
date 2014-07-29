class AddImageToDatasets < ActiveRecord::Migration
  def up
    add_attachment :datasets, :image
  end

  def down
    remove_attachment :datasets, :image
  end
end
