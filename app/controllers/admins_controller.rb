class AdminsController < ApplicationController
    before_action :check_admin, only: [:show]

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

    def edit
        @user = User.find(:user_id)
    end

    def update
        raise params.inspect
    end

    private
        def check_admin
            unless current_user.admin?
                redirect_to user_url(current_user.id)
            end
        end
end