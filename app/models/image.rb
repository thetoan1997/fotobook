class Image < ApplicationRecord
    belongs_to :imageable, polymorphic: true, optional: true

    has_one_attached :image_link
end
