class AddPictureRefToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_reference :albums, :picture, foreign_key: true
  end
end
