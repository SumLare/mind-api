class View < ApplicationRecord
  belongs_to :user
  belongs_to :answer, counter_cache: true
end
