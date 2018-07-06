class Picture < ApplicationRecord
    belongs_to :pictureable, polymorphic: true

    has_many :user_likes

    def count_like
        self.user_likes.size
    end
end
