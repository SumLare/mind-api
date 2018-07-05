class User < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :questions_for_respondent, class_name: 'Question', foreign_key: :respondent_id
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :reports, dependent: :destroy

  has_many :follower_relationship, class_name: 'Following', foreign_key: :follower_id, dependent: :destroy
  has_many :followed_relationship, class_name: 'Following', foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :follower_relationship, source: :followed
  has_many :followers, through: :followed_relationship, source: :follower

  validates :email, email: true, uniqueness: { case_sensitive: false }, allow_nil: true

  has_secure_token :api_token
  has_secure_password
  has_one_attached :avatar
end
