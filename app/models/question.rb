class Question < ApplicationRecord
  belongs_to :user
  belongs_to :respondent, class_name: 'User'

  validates :content, presence: true
end
