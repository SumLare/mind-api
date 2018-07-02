class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :quuestions_for_respondent, class_name: 'Question', foreign_key: :respondent_id
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, email: true, uniqueness: { case_sensitive: false }, allow_nil: true

  has_secure_token :api_token
  has_secure_password
  has_one_attached :avatar
end
