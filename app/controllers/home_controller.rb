class HomeController < ApplicationController
    def index
        @photos = Photo.all
    end

    def show
        @user = User.find(current_user.id)
        @photos_feeds = Photo.where(user_id: @user.following_ids).order('updated_at desc').limit(5)
        @albums_feeds = get_albums_recently_feeds(@user)
        @photos_discover = get_photos_recently_discover()
        @albums_discover = get_albums_recently_discover()
    end

    private
        def list_users_following(user)
            $user_following = Array.new
            user.following_ids.each do |usr|
                $user_following.push(usr)
            end
            return $user_following
        end
    protected
        def get_photos_recently_feeds(user)
            return Photo.where(user_id: user.following_ids).order('updated_at desc').limit(5)
        end
    private
        def get_albums_recently_feeds(user)
            @albums_of_user = Album.where(user_id: list_users_following(user)).order('updated_at desc').limit(5)
            return @albums_of_user
        end
    private
        def get_photos_recently_discover
            return Photo.order('updated_at desc').limit(5)
        end
    private
        def get_albums_recently_discover
            return Album.order('updated_at desc').limit(5)
        end
    private
        def get_user_of_photo(photo)
            User.find(photo.user_id)
        end
end
