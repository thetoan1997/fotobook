class PhotosController < ApplicationController
    before_action :check_user_use_edit_new, only: [:edit, :new]
    before_action :get_user, :only => [:new, :create, :edit, :update]

    def show
        @photo = Photo.find(params[:id])
    end 

    def new
        @photo = @user.photos.new
        @photo.build_image
    end

    def create
        @photo = @user.photos.create!(photo_params)
        if @photo.save
            redirect_to user_path(current_user.id), notice: t('.success')
        else
            render :new, alert: t('.error')
        end
    end

    def edit
        @photo = @user.photos.find(params[:id])
    end

    def update
        @photo = @user.photos.find(params[:id])
        @photo.update(title: params[:photo][:title], 
                      description: params[:photo][:description], 
                      private: params[:photo][:private])
        redirect_to user_path(current_user.id)
    end

    def destroy
        photo = Photo.find(params[:id])
        photo.destroy
        if photo.destroyed?
            redirect_to user_path(current_user.id), notice: t('.success')
        else
            render :edit, alert: t('.error')
        end
    end
    protected
        def check_user_use_edit_new
            if current_user != User.find(params[:user_id]) && !current_user.admin?
                redirect_to home_path(current_user.id)
            end
        end

    private
        def get_user
            @user = User.find(params[:user_id])
        end

        def photo_params
            params.require(:photo).permit(:title, 
                                          :description, 
                                          :private, 
                                          :user_id, 
                                          image_attributes: 
                                             [:image_link, 
                                              :imageable_id, 
                                              :imageable_type])
        end

end 