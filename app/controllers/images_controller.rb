class ImagesController < ApplicationController
    def show
        @image = Image.find(params[:id])
    end
    def new
        @image = Image.new
    end
    def create
        @image = Image.create!(image_params)
        redirect_to root_path
    end

    def destroy
        album_id = Image.find(params[:id]).imageable.id
        image = Image.find(params[:id])
        image.destroy
        if image.destroyed?
            redirect_to edit_user_album_path(user_id: current_user.id, 
                                             id: album_id), notice: t('.success')        
        else
            render :edit, alert: t('.error')
        end
    end
    
    private
    def image_params
        params.require(:image).permit(:image_link, 
                                      :image_url , 
                                      :imageable_id, 
                                      :imageable_type)
    end
end