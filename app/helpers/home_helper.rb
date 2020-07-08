module HomeHelper
    def check_avatar_exist? user
        user.avatar.attached?
    end

    def check_image_exist? image
       image.image_link.attached?
    end

    def check_is_admin? user
        user.admin?
    end

    def show
        @photos_feeds = User.find(current_user.id).photos
    end
    private
        def list_users_following(user)
            $user_following = Array.new
            user.following_ids.each do |usr|
                $user_following.push(usr)
            end
            return $user_following
        end
    private
        def get_photos_recently_feeds(user)
            @photos_of_user = Photo.where(user_id: list_users_following(user)).order('updated_at desc').limit(5)
            return @photos_of_user
        end
end
