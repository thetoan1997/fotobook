class AdminsController < ApplicationController
    before_action :check_admin, only: :show

    SIZE_PER_PAGE = 20
    def show
        @user = User.find(params[:id])
        @photos = Photo.all
                       .order(updated_at: :desc)
                       .includes(:image)
                       .page(params[:page_photo_admin]).per(SIZE_PER_PAGE) 
        @albums = Album.all
                        .order(updated_at: :desc)
                        .includes(:images)
                        .page(params[:page_album_admin]).per(SIZE_PER_PAGE)
        @users = User.all
    end

    private
        def check_admin
            unless current_user.admin?
                redirect_to user_path(current_user.id)
            end
        end
end