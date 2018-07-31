class PhotosController < ApplicationController
    before_action :check_user_use_edit_new, only: [:edit, :new]
    
    def index
        @photos = Photo.paginate(page: params[:page], per_page: 10)

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
        if @photo.save
            flash[:notice] = "Uploading photo successfully"
            redirect_to user_url(current_user.id)
        else
            flash[:error] = "There was a problem uploading the photo"
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:user_id])
        @photo = @user.photos.find(params[:id])
    end

    def update
        @user = User.find(params[:user_id])
        @photo = @user.photos.find(params[:id])
        @photo.update(title: params[:photo][:title], 
                      description: params[:photo][:description], 
                      private: params[:photo][:private])
        redirect_to user_url(current_user.id)
    end

    def destroy
        Photo.destroy(params[:id])
        flash[:success] = "Photo deleted"
        redirect_to user_url(current_user.id)
    end
    protected
        def check_user_use_edit_new
            if current_user != User.find(params[:user_id]) && !current_user.admin?
                redirect_to home_url(current_user.id)
            end
        end

    private
        def photo_params
            params.require(:photo).permit(:title, 
                :description, :private, :user_id, 
                image_attributes: [:image_link, :imageable_id, :imageable_type])
        end

end 