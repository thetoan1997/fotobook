class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @photos = Photo.where("user_id = ?",params[:id])
        @albums = get_albums(@user)
        @photo_links = get_images()
        @user_followings = get_followings(@user)
        @user_followers = get_followers(@user)
    end
    private 
        def get_photos(user)
            return Photo.where("user_id = ?",params[:id])
        end
    private
        def get_albums(user)
            return user.albums
        end
    private
        def get_images
            @photos = get_photos(params[:id])
            return Image.where(imageable_id: @photos, imageable_type: "Photo")
        end
    private
        def get_followings(user)
            return user.followings
        end
    private
        def get_followers(user)
            return user.followers
        end    

end
