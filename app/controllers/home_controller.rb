class HomeController < ApplicationController
    def index
        @photos = Photo.all
        @mess = "Home Controller"
        @photos_feeds = get_photos_recently_feeds(User.find(1))
        @albums_feeds = get_albums_recently_feeds(User.find(1))
        @photos_discover = get_photos_recently_discover()
        @albums_discover = get_albums_recently_discover()
    end

    def show
        @user = User.find(params[:id])
        @id_photos_of_user = photos_of_user_following(@user)
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
end
