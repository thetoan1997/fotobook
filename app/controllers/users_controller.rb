class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @photos = check_user_get_photos()
        @photos_public = check_user_get_photos_public()
        @albums = check_user_get_albums()
        @albums_public = check_user_get_albums_public()
        @photo_links = get_images()
        @user_followings = get_followings(@user)
        @user_followers = get_followers(@user)
    end

    private
        def check_user_get_photos
            return Photo.where("user_id = ?",params[:id])
                        .page(params[:user_photos])
        end
        
        def check_user_get_photos_public
            return Photo.where("user_id = :id AND private = :scope",
                                    {id: params[:id], scope: false})
        end

        def check_user_get_albums
            return Album.where("user_id = ?",params[:id])
                        .page(params[:user_albums])
        end
        
        def check_user_get_albums_public
            return Album.where("user_id = :id AND private = :scope",
                                    {id: params[:id], scope: false})
        end


        def get_photos(user)
            return Photo.where("user_id = ?",params[:id])
        end

        def get_albums(user)
            return user.albums
        end
    
        def get_images
            return Image.where(imageable_id: get_photos(params[:id]), imageable_type: "Photo")
        end

        def get_followings(user)
            return user.followings
        end

        def get_followers(user)
            return user.followers
        end    

end
