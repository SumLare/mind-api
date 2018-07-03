class Upvote < ApplicationRecord
  belongs_to :upvotable, polymorphic: true, counter_cache: :upvotes_count
  belongs_to :user

  validates :user, uniqueness: { scope: [:upvotable_id, :upvotable_type] }
end
