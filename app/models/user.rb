class User < ActiveRecord::Base

    has_secure_password
    
    def authenticate_with_credentials
    end
end
