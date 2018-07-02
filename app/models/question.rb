class Question < ApplicationRecord
  belongs_to :user
  belongs_to :respondent, class_name: 'User'

  has_many :answers, dependent: :destroy
  has_many :upvotes, as: :upvotable

  validates :content, presence: true
end
