class Following < ApplicationRecord
  belongs_to :user
  belongs_to :follower, class_name: 'User'

  validate :not_self

  private

  def not_self
    errors.add(:follower, "can't be equal to user") if user == follower
  end
end
