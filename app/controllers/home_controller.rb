class HomeController < ApplicationController
    before_action :check_admin, only: [:show]
    skip_before_action :authenticate_user!, only: :index
    PHOTO_LIMIT = 5
    def index
        @photos_guest = Photo.where(private: false)
                             .order(updated_at: :desc)
                             .page(params[:page_photo_guest])                   
        @albums_guest = Album.where(private: false)
                             .order(updated_at: :desc)
                             .page(params[:page_album_guest])    
    end

    def show
        @user = User.find(current_user.id)
        @photos_feeds = Photo.where(user_id: @user.following_ids)
                             .order(updated_at: :desc)
                             .page(params[:page_photo_feeds])

        @albums_feeds = Album.where(user_id: @user.following_ids)
                             .order(updated_at: :desc)
                             .page(params[:page_album_feeds])
 
        @photos_discover = get_photos_recently_discover()
        @albums_discover = get_albums_recently_discover()

    end

    private

        def get_photos_recently_discover
            return Photo.order(updated_at: :desc)
                               .page(params[:page_photo_discover])
        end
    
        def get_albums_recently_discover
            return Album.order(updated_at: :desc)
                               .page(params[:page_album_discover])
        end

        def check_admin
            if current_user.admin?
                redirect_to admin_path(current_user.id)
            end
        end

end
