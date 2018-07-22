class PhotosController < ApplicationController
    def index
        @photos = Photo.all
        @photo_of_user = User.find(params[:user_id]).photos
    end

    def show
        @photo = Photo.find(params[:id])
    end 

    def new
        @photo = Photo.new
    end

    def create
        @photo = Photo.new(photo_params)
        @photo.image.attach(params[:image][:image_link])
        if @photo.save
            flash[:notice] = "Upload photo successful and welcome!"
            @photo.image.create(params[:image])
            redirect_to user_path(current_user.id)
        else
            flash[:notice] = "Fail"
            render 'new'
        end
    end

    def edit
        @photo = Photo.find(params[:id])
    end

    private
        def photo_params
            params.require(:photo).permit(:title, :description, :private, :user_id, image_attributes: [:image_url, :imageable_type, :imageable_id, :image_link])
        end
end 