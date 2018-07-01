class User < ApplicationRecord
  validates :email, email: true, uniqueness: { case_sensitive: false }, allow_nil: true

  has_secure_token :api_token
  has_secure_password
end
