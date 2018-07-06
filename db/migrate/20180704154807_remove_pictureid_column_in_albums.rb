class RemovePictureidColumnInAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :picture_id, :integer
  end
end
