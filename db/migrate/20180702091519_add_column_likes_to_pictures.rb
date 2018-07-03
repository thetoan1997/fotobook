class AddColumnLikesToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :likes, :integer
  end
end
