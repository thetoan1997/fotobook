class UsersController < ApplicationController
    before_action :get_user, :only => [:show, :edit, :update]

    def show
        @photos = check_user_get_photos()
        @photos_public = check_user_get_photos_public()
        @albums = check_user_get_albums()
        @albums_public = check_user_get_albums_public()
        @photo_links = get_images()
        @user_followings = get_followings(@user)
        @user_followers = get_followers(@user)
    end

    def edit

    end
    
    def update
        @user.update( avatar: params[:user][:avatar],
                      firstname: params[:user][:firstname], 
                      lastname: params[:user][:lastname], 
                      email: params[:user][:email])
        redirect_to home_path(current_user.id)
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        if user.destroyed?
            redirect_to home_path(current_user.id), notice: t('.success')
        else
            redirect_to home_path(current_user.id), alert: t('.error')
        end
    end

    private
        def get_user
            @user = User.find(params[:id])
        end

        def check_user_get_photos
            Photo.where(user_id: params[:id])
                            .includes(:image)
                            .page(params[:user_photos])
        end
        
        def check_user_get_photos_public
            Photo.where(user_id: params[:id], private: false)
                            .includes(:image)
        end

        def check_user_get_albums
            Album.where(user_id: params[:id])
                            .includes(:images)
                            .page(params[:user_albums])
        end
        
        def check_user_get_albums_public
            Album.where(user_id: params[:id], private: false)
                            .includes(:image)
        end


        def get_photos(user)
            Photo.where(user_id: params[:id])
        end

        def get_albums(user)
            user.albums
        end
    
        def get_images
            Image.where(imageable_id: get_photos(params[:id]), imageable_type: "Photo")
        end

        def get_followings(user)
            user.followings
        end

        def get_followers(user)
            user.followers
        end    

end
