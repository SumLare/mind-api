class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  has_many :comments, dependent: :destroy

  has_one_attached :video
end
