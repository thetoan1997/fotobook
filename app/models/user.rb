class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :albums

    has_many :photos

    has_many :likes

    has_many :active_user_followings, class_name: "UserFollowing", 
                                    foreign_key: "follower_id", 
                                    dependent: :destroy
    has_many :followings, through: :active_user_followings, source: :followed

    has_many :passive_user_followings, class_name: "UserFollowing",
                                    foreign_key: "followed_id",
                                    dependent: :destroy
    has_many :followers, through: :passive_user_followings, source: :follower

    accepts_nested_attributes_for :active_user_followings

    has_one_attached :avatar

    def follow(other_user)
        followings << other_user
    end

    def unfollow(other_user)
        followings.delete(other_user)
    end

    def is_following?(other_user)
        followings.include?(other_user)
    end

    def count_following 
        self.followings.size
    end

    def count_followed
        self.followers.size
    end

    def count_photo
        Photo.where("user_id = :id", { id: self.id }).size
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

    def get_photos
        Photo.where("user_id = :id", {id: self.id})
    end

    def get_albums
        Album.where("user_id = :id", {id: self.id})
    end

    def get_photos_recently_discover
        Photo.order('updated_at desc').limit(5)
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

    def get_photos_recently_feeds
        self.following_ids.each do |usr|
            $user_following.push(usr)
        end
        Photo.where(user_id: $user_following).order('updated_at desc').limit(5)
    end

    def get_albums_of_user_following(user_id)
        Album.where(user_id: user_id, private: false).order('updated_at desc').limit(5)
    end

    def get_photos_of_user_following(user_id)
        Photo.where(user_id: user_id, private: false).order('updated_at desc').limit(5)
    end
end
