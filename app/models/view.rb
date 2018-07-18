class View < ApplicationRecord
  belongs_to :user
  belongs_to :viewable, polymorphic: true

  validates :user, uniqueness: { scope: [:viewable_id, :viewable_type] },
                   if: -> { viewable_type == 'Answer' }

  after_save -> { viewable.update_counter_cache }, if: -> { viewable_type == 'Answer' }
  after_destroy -> { viewable.update_counter_cache }, if: -> { viewable_type == 'Answer' }
end
