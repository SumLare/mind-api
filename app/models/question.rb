class Question < ApplicationRecord
  belongs_to :user
  belongs_to :respondent, class_name: 'User'

  has_many :answers, dependent: :destroy

  validates :content, presence: true
end
