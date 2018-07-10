class Picture < ApplicationRecord
    belongs_to :pictureable, polymorphic: true

    has_many :likes, as: :likeable

    def count_like
        self.user_likes.size
    end

    $user_liked = Array.new
    def info_user_like
        self.user_likes.each do |user|
            $user_liked.push(User.where("id = ?", user.user_id).pluck(:firstname))
            puts $user_liked
        end
    end

    def get_date_picture
        puts self.updated_at.to_formatted_s(:short)
    end

end
