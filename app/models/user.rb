class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :email, email: true, uniqueness: { case_sensitive: false }, allow_nil: true

  has_secure_token :api_token
  has_secure_password
  has_one_attached :avatar
end
