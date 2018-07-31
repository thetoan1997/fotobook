class AdminsController < ApplicationController
    before_action :check_admin, only: [:show]

    def show
        @user = User.find(params[:id])
        @photos = Photo.all 
        @albums = Album.all
        @users = User.all
    end

    private
        def check_admin
            unless current_user.admin?
                redirect_to user_url(current_user.id)
            end
        end
end