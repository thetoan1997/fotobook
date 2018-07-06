class RemoveColumnAlbumidFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :album_id, :integer
  end
end
