class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :picture_link
      t.string :title
      t.string :description
      t.boolean :private, default: false

      t.timestamps
    end
  end
end
