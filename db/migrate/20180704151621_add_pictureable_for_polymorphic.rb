class AddPictureableForPolymorphic < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :pictureable_id, :integer
    add_column :pictures, :pictureable_type, :string
    add_index :pictures, [ :pictureable_id, :pictureable_type ]
  end
end
