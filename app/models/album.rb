class Album < ApplicationRecord
    belongs_to :user

    has_many :images, as: :imageable, dependent: :destroy

    has_many :likes, as: :likeable

    accepts_nested_attributes_for :images
    
    validates :title, presence: true, length: { maximum: TITLE_MAX_LENGTH }
    validates :description, presence: true, length: { maximum: DESCRIPTION_MAX_LENGTH }
    validates :private, inclusion: { in:[ true, false ] }
end
