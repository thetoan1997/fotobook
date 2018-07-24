class UserMailer < ApplicationMailer
    default from: 'thetoan@gmail.com'

    def welcome_email(user)
        @user = user
        @url = 'http://example.com/login'
        mail(to: "diepthetoan1997@gmail.com", subject: "Welcome to my Site")
    end
end
