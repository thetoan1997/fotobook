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
            flash[:notice] = "Uploading album successfully"
            redirect_to user_url(current_user.id)
        else
            flash[:error] = "There was a problem uploading the album"
            render "new"
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
            unless (params[:album][:images_attributes]["#{i}"][:image_link].nil?)
                @album.images.create!(image_link: params[:album][:images_attributes]["#{i}"][:image_link])
            end
        end
        
        redirect_to user_url(current_user.id)
    end

    def destroy
        Album.destroy(params[:id])
        flash[:success] = "Album deleted"
        redirect_to user_url(current_user.id)
    end

    protected
        def check_user_use_edit_new
            if current_user != User.find(params[:user_id])
                redirect_to user_url(current_user.id)
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