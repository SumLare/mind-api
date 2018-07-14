class User < ApplicationRecord
  attr_accessor :current_password

  has_many :questions, dependent: :destroy
  has_many :questions_for_respondent, class_name: 'Question', foreign_key: :respondent_id
  has_many :answers, through: :questions_for_respondent, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :follower_relationship, class_name: 'Following', foreign_key: :follower_id, dependent: :destroy
  has_many :followed_relationship, class_name: 'Following', foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :follower_relationship, source: :followed
  has_many :followers, through: :followed_relationship, source: :follower
  has_many :views, as: :viewable, dependent: :destroy
  has_many :viewed_answers, through: :views, source: :viewable, source_type: 'Answer'
  has_many :profile_views, through: :views, source: :viewable, source_type: 'User'

  validates :email, email: true, uniqueness: { case_sensitive: false }
  validates :bio, length: { maximum: 150 }, allow_nil: true
  validate :change_password

  has_secure_token :api_token
  has_secure_password
  has_one_attached :avatar

  def full_name
    "#{first_name} #{last_name}"
  end

  def unviewed_answers_count(user)
    user.answers.select { |a| !a.viewed?(self) }.count
  end

  private

  def change_password
    return if password_digest_was.nil? || !password_digest_changed?

    unless BCrypt::Password.new(password_digest_was) == current_password
      errors.add(:base, 'wrong current password')
    end
  end
end
