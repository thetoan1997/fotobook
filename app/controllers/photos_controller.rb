class PhotosController < ApplicationController
    def index
        @photos = Photo.all
        @photo_of_user = User.find(params[:user_id]).photos
    end
    def show
        @photo = Photo.find(params[:id])
    end 
end