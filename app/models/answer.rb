class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :video, presence: true

  has_one_attached :video
end
