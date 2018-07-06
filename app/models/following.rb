class Following < ApplicationRecord
  belongs_to :followed, class_name: 'User'
  belongs_to :follower, class_name: 'User'

  validates :followed, :follower, presence: true
  validates :follower, uniqueness: { scope: :followed }
  validate :not_self

  private

  def not_self
    errors.add(:follower, "can't be equal to user") if followed == follower
  end
end
