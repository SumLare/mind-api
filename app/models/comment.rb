class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  has_many :upvotes, as: :upvotable
  has_many :reports, dependent: :destroy

  validates :content, presence: true
end
