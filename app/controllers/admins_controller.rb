class AdminsController < ApplicationController
    def show
        @user = User.find(params[:id])
        @photos = Photo.all 
        @albums = Album.all
        @users = User.all
    end
end