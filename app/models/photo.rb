class Photo < ApplicationRecord
    has_one :image, as: :imageable, dependent: :destroy

    has_many :likes, as: :likeable

    belongs_to :user, optional: true

    accepts_nested_attributes_for :image

    validates :title, presence: true, length: { maximum: TITLE_MAX_LENGTH }
    validates :description, presence: true, length: { maximum: DESCRIPTION_MAX_LENGTH }
    validates :private, inclusion: { in:[ true, false ] }

end
