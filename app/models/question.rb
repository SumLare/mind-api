class Question < ApplicationRecord
  MAX_CONTENT_LENGTH = 300

  belongs_to :user
  belongs_to :respondent, class_name: 'User'

  has_one :answer, dependent: :destroy
  has_many :upvotes, as: :upvotable, dependent: :destroy

  validates :content, presence: true, length: { maximum: MAX_CONTENT_LENGTH }

  def answered
    answer.present?
  end
end
