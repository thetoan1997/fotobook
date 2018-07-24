class Photo < ApplicationRecord
    has_one :image, as: :imageable

    has_many :likes, as: :likeable

    belongs_to :user, optional: true

    accepts_nested_attributes_for :image
end
