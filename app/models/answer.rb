class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  has_many :comments, dependent: :destroy

  validates :video, presence: true

  has_one_attached :video
end
