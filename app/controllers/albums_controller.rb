class AlbumsController < ApplicationController
    before_action :check_user_use_edit_new, only: [:edit, :new]

    def new 
        @user = User.find(params[:user_id])
        @album = @user.albums.new
        @album.images.build
    end
    
    def create
        @user = User.find(params[:user_id])
        @album = @user.albums.create!(album_params)
        if @album.save
            redirect_to user_path(current_user.id), notice: t('.success')
        else
            render :new, alert: t('.error')
        end
    end

    def edit
        @user = User.find(params[:user_id])
        @album = @user.albums.find(params[:id])
    end

    def update
        @user = User.find(params[:user_id])
        @album = @user.albums.find(params[:id])
        @album.update!(title: params[:album][:title],
                       description: params[:album][:description],
                       private: params[:album][:private])
        0..24.times do |i|
            unless (params[:album][:images_attributes]["#{i}"].nil?)
                @album.images.create!(image_link: params[:album][:images_attributes]["#{i}"][:image_link])
            end
        end
        
        redirect_to user_path(current_user.id)
    end

    def destroy
        album = Album.find(params[:id])
        album.destroy
        if album.destroyed?        
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
        def album_params
            params.require(:album).permit(:title,
                                          :description, 
                                          :private, 
                                          :user_id,
                                          images_attributes: [ :image_link ]
            )
        end
        
        def image_params
            params.require(:album).permit(
                images_attributes: [ :image_link ]
            )
        end

end