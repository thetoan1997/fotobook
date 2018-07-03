class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :picture_link
      t.string :title
      t.string :description
      t.string :sharing_mode

      t.timestamps
    end
  end
end
