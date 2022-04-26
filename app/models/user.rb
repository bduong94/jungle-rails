class User < ActiveRecord::Base

    has_secure_password
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :password_confirmation, presence: true

    def authenticate_with_credentials email, password
        # user = User.find_by_email(params[:email])
        # if user && user.authenticate(params[:password])

    end
end
