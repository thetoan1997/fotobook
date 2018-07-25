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
            flash[:notice] = "Uploading album successfully"
            redirect_to user_path(current_user.id)
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
        raise params.inspect
    end


    private
        def album_params
            params.require(:album).permit(:title,
                :description, :private, :user_id,
                images_attributes: [ :image_link, 
                                     :image_url, 
                                     :imageable_id, 
                                     :imageable_type ])
        end
end