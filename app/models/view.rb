class View < ApplicationRecord
  belongs_to :user
  belongs_to :viewable, polymorphic: true

  validates :user, uniqueness: { scope: [:viewable_id, :viewable_type] },
                   if: -> { viewable_type == 'Answer' }
end
