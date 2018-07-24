class AlbumsController < ApplicationController
    def new 
        @user = User.find(params[:user_id])
        @album = @user.albums.new
        @album.images.build
    end
    
    def create
        @user = User.find(params[:user_id])
        @album = @user.albums.create!(album_params)
        if @album.save
            flash[:notice] = "Upload album successful"
            redirect_to user_path(current_user.id)
        else
            flash[:notice] = "Fail"
            render "new"
        end
    end
    private
        def album_params
            params.require(:album).permit(:title,
                :description, :private, :user_id,
                images_attributes: [ :image_link, :image_url, :imageable_id, :imageable_type ])
        end
end