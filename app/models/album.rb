class Album < ApplicationRecord
    belongs_to :user

    has_many :images, as: :imageable, dependent: :destroy

    has_many :likes, as: :likeable

    accepts_nested_attributes_for :images
    
    def count_image
        Image.where("imageable_id = :id AND imageable_type= :type",
                        {id: self.id, type: "Album"}).size
    end
end
