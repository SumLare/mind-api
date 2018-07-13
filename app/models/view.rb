class View < ApplicationRecord
  belongs_to :user
  belongs_to :answer, counter_cache: true

  validates :user, uniqueness: { scope: :answer }
end
