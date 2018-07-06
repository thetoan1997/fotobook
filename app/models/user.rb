class User < ApplicationRecord
    has_many :albums

    has_many :pictures, as: :pictureable

    has_many :active_user_followings, class_name: "UserFollowing", 
                                    foreign_key: "follower_id", 
                                    dependent: :destroy
    has_many :following, through: :active_user_followings, source: :followed

    has_many :passive_user_followings, class_name: "UserFollowing",
                                    foreign_key: "followed_id",
                                    dependent: :destroy
    has_many :followers, through: :passive_user_followings, source: :follower


    def follow(other_user)
        following << other_user
    end

    def unfollow(other_user)
        following.delete(other_user)
    end

    def is_following?(other_user)
        following.include?(other_user)
    end

    def count_following
        self.following_ids.size
    end

    def count_followed
        self.follower_ids.size
    end

    def count_picture
        Picture.where("pictureable_id = :id AND pictureable_type= :type",
                        {id: self.id, type: "User"}).size
    end

    def count_album
        Album.where("user_id = :id", { id: self.id }).size
    end

end
