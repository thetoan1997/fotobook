class AdminsController < ApplicationController
    before_action :check_admin, only: :show

    def show
        @user = User.find(params[:id])
        @photos = Photo.all
                       .order(updated_at: :desc)
                       .page(params[:page_photo_admin]) 
        @albums = Album.all
                        .order(updated_at: :desc)
                        .page(params[:page_album_admin])
        @users = User.all
    end

    private
        def check_admin
            unless current_user.admin?
                redirect_to user_path(current_user.id)
            end
        end
end