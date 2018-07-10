class User < ApplicationRecord
    has_many :albums

    has_many :photos

    has_many :likes

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

    def do_not_like(type, id)
        Like.where(user_id: self.id, likeable_type: type, likeable_id: id).delete_all
    end

    def do_like(type, id) 
        if Like.exists?(user_id: self.id, likeable_type: type, likeable_id: id)
            do_not_like(type, id)
        else
            Like.create(user_id: self.id, likeable_type: type, likeable_id: id)
        end
    end

    def get_pictures
        Picture.where("pictureable_id = :id AND pictureable_type= :type",
                        {id: self.id, type: "User"})
    end

    def get_albums
        Album.where("user_id = :id", {id: self.id})
    end

    def get_pictures_recently_discover
        Picture.order('updated_at desc').limit(5)
    end

    def get_albums_recently_discover
        Album.order('updated_at desc').limit(5)
    end

    $user_following = Array.new
    def get_albums_recently_feeds
        self.following_ids.each do |usr|
            $user_following.push(usr)
        end
        Album.where(user_id: $user_following).order('updated_at desc').limit(5)
    end

    def get_pictures_recently_feeds
        self.following_ids.each do |usr|
            $user_following.push(usr)
        end
        Picture.where(pictureable_id: $user_following, pictureable_type: "User").order('updated_at desc').limit(5)
    end

end
