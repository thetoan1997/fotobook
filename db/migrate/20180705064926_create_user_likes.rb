class CreateUserLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_likes do |t|
      t.belongs_to :user, index: true
      t.integer :picture_id
      t.timestamps
    end
  end
end
