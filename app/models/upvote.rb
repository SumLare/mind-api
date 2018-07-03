class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :upvotable, polymorphic: true, counter_cache: :upvotes_count

  validates :user, uniqueness: { scope: [:upvotable_id, :upvotable_type] }
end
