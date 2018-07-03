class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  has_many :upvotes, as: :upvotable, dependent: :destroy
  has_many :reports, as: :reportable, dependent: :destroy

  validates :content, presence: true
end
