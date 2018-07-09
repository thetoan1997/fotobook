class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.boolean :private, default: false
      t.integer :user_id
      t.timestamps
    end
    add_index :albums, :user_id
  end
end
