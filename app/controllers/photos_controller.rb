class PhotosController < ApplicationController
    def index
        @photos = Photo.all
        @photo_of_user = User.find(params[:user_id]).photos
    end

    def show
        @photo = Photo.find(params[:id])
    end 

    def new
        @user = User.find(params[:user_id])
        @photo = @user.photos.new
        @photo.build_image
    end

    def create
        @user = User.find(params[:user_id])
        @photo = @user.photos.create!(photo_params)
        # Image.find(62).image_link.attach(params[:photo][:image_attributes][:image_link])
        if @photo.save
            flash[:notice] = "Upload photo successful and welcome!"
            redirect_to user_path(current_user.id)
        else
            flash[:notice] = "Fail"
            render 'new'
        end
    end

    private
        def photo_params
            params.require(:photo).permit(:title, 
                :description, :private, :user_id, 
                image_attributes: [:image_link, :image_url, :imageable_id, :imageable_type])
        end

end 