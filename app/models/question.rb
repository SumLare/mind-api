class Question < ApplicationRecord
  belongs_to :user
  belongs_to :respondent, class_name: 'User'

  has_one :answer, dependent: :destroy
  has_many :upvotes, as: :upvotable

  validates :content, presence: true

  def answered
    answer.present?
  end
end
