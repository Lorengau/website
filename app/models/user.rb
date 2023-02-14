# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual
#
# (password_digest_confirmation:string virtual)

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

    require "bcrypt"

    #has_secure_password
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, messages: "must be a valid email address"}

    attr_reader :password

    def password=(unencrypted_password)
        unless unencrypted_password.empty?
            @password = unencrypted_password
            self.encrypted_password = BCrypt::Password.create(unencrypted_password)
        end
    end

    def authenticate(unencrypted_password)
        if BCrypt::Password.new(self.encrypted_password) == unencrypted_password
            return self
        else
            return false
        end
    end

    def confirmation_required?
        false
    end
end
