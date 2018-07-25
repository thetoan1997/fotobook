class HomeController < ApplicationController
    PHOTO_LIMIT = 5

    def index
        @photos = Photo.all
    end

    def show
        @user = User.find(current_user.id)
        @photos_feeds = Photo.where(user_id: @user.following_ids)
                             .order(updated_at: :desc)
                             .limit(PHOTO_LIMIT)
        @albums_feeds = Album.where(user_id: @user.following_ids)
                             .order(updated_at: :desc)
                             .limit(PHOTO_LIMIT)
        @photos_discover = get_photos_recently_discover()
        @albums_discover = get_albums_recently_discover()
    end

    private

        def get_photos_recently_discover
            return Photo.order(updated_at: :desc)
                        .limit(PHOTO_LIMIT)
        end
    
        def get_albums_recently_discover
            return Album.order(updated_at: :desc)
                        .limit(PHOTO_LIMIT)
        end
    
        def get_user_of_photo(photo)
            User.find(photo.user_id)
        end
end
