class ImagesController < ApplicationController
    def show
        @image = Image.find(params[:id])
    end
    def new
        @image = Image.new
    end
    def create
        @image = Image.create!(image_params)
        Image.find(8).image_link.attach(params[:image][:image_link])
        redirect_to root_path
    end
    
    private
    def image_params
        params.require(:image).permit(:image_link, 
            :image_url , :imageable_id, 
            :imageable_type)
    end
end