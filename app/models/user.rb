class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :questions_for_respondent, class_name: 'Question', foreign_key: :respondent_id
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :followers, class_name: 'Following', foreign_key: :user_id, dependent: :destroy
  has_many :followings, class_name: 'Following', foreign_key: :follower_id, dependent: :destroy

  validates :email, email: true, uniqueness: { case_sensitive: false }, allow_nil: true

  has_secure_token :api_token
  has_secure_password
  has_one_attached :avatar
end
