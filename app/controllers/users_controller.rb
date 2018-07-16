class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @count_photo = Photo.where("user_id = :id", { id: params[:id] }).size
        @count_album = Album.where("user_id = :id", { id: params[:id] }).size
        @count_following = User.find(params[:id]).followings.size
        @count_follower = User.find(params[:id]).followers.size
    end
    private 
        def get_photos
            
        end
    private
        def get_albums

        end

end
