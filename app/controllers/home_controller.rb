class HomeController < ApplicationController
    before_action :check_admin, only: [:show]

    PHOTO_LIMIT = 5
    def index
        redirect_to home_url(current_user.id)
    end

    def show
        @user = User.find(current_user.id)
        @photos_feeds = Photo.where(user_id: @user.following_ids)
                             .order(updated_at: :desc)
                             .page(params[:page])                   
        @albums_feeds = Album.where(user_id: @user.following_ids)
                             .order(updated_at: :desc)
                             .page(params[:page_album])
        @photos_discover = get_photos_recently_discover()
        @albums_discover = get_albums_recently_discover()
    end

    private

        def get_photos_recently_discover
            return Photo.order(updated_at: :desc)
                               .page(params[:page])
        end
    
        def get_albums_recently_discover
            return Album.order(updated_at: :desc)
                               .page(params[:page])
        end

        def check_admin
            if current_user.admin?
                redirect_to admin_url(current_user.id)
            end
        end

end
