class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
    has_many :albums

    has_many :photos

    has_many :likes

    has_many :active_user_followings, class_name: "UserFollowing", 
                                    foreign_key: "follower_id", 
                                    dependent: :destroy
    has_many :followings, through: :active_user_followings, source: :followed

    has_many :passive_user_followings, class_name: "UserFollowing",
                                    foreign_key: "followed_id",
                                    dependent: :destroy
    has_many :followers, through: :passive_user_followings, source: :follower

    accepts_nested_attributes_for :active_user_followings

    has_one_attached :avatar

    validates :firstname, presence: true, length: { maximum: NAME_MAX_LENGTH }
    validates :lastname, presence: true, length: { maximum: NAME_MAX_LENGTH }
    validates :email, presence: true, length: { maximum: EMAIL_MAX_LENGTH }
    validates :encrypted_password, presence: true, length: { maximum: PASSWORD_MAX_LENGTH }

    protected
        def send_devise_notification(notification, *args)
            message = devise_mailer.send(notification, self, *args)
            message.deliver_now
        end
end
