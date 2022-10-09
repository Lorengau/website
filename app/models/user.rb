# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual
#
# (password_digest_confirmation:string virtual)

class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, messages: "must be a valid email address"}
end
