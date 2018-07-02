class Upvote < ApplicationRecord
  belongs_to :upvotable, polymorphic: true, counter_cache: :upvotes_count
end
