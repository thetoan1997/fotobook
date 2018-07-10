class Album < ApplicationRecord
    belongs_to :user, optional: true

    has_many :images, as: :imageable

    has_many :likes, as: :likeable
    
    def count_picture
        Picture.where("pictureable_id = :id AND pictureable_type= :type",
                        {id: self.id, type: "Album"}).size
    end
end
