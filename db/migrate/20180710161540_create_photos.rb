class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.boolean :private, default: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
