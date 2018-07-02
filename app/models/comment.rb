class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  has_many :upvotes, as: :upvotable

  validates :content, presence: true
end
