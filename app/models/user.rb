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
  has_many :views, dependent: :destroy
  has_many :viewed_answers, through: :views, source: :viewable, source_type: 'Answer'
  has_many :viewed_profiles, through: :views, source: :viewable, source_type: 'User'

  validates :email, email: true, uniqueness: { case_sensitive: false }
  validates :bio, length: { maximum: 150 }, allow_nil: true
  validate :change_password

  has_secure_token :api_token
  has_secure_password
  has_one_attached :avatar

  def full_name
    "#{first_name} #{last_name}"
  end

  # user is person who looks at current object profile
  def missed_answers_count(user)
    answers.where('answers.created_at > ?', latest_profile_view(user))
           .where.not(answers: { id: user.viewed_answers.ids }).count
  end

  private

  def latest_profile_view(user)
    user.views.where(viewable: self).last&.created_at
  end

  def change_password
    return if password_digest_was.nil? || !password_digest_changed?
    return unless BCrypt::Password.new(password_digest_was) == current_password

    errors.add(:base, 'wrong current password')
  end
end
