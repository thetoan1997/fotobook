module PhotosHelper
    def check_image_exist? image
        image.image_link.attached?
     end
end
