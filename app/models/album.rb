class Album < ApplicationRecord
    belongs_to :user

    has_many :images, as: :imageable, dependent: :destroy

    has_many :likes, as: :likeable

    accepts_nested_attributes_for :images
    
end
