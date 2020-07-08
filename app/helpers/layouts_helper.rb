module LayoutsHelper
    def check_avatar_exist? user
        user.avatar.attached?
    end

    def check_image_exist? image
       image.image_link.attached?
    end

    def check_is_admin? user
        user.admin?
    end
end