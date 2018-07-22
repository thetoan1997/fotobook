class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @photos = get_photos(@user)
        @albums = get_albums(@user)
        @photo_links = get_images()
        @user_followings = get_followings(@user)
        @user_followers = get_followers(@user)
    end
    private 
        def get_photos(user)
            return Image.where(imageable_id: User.find(params[:id]).photo_ids, imageable_type: "Photo")
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
