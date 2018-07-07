class Report < ApplicationRecord
  belongs_to :user
  belongs_to :reportable, polymorphic: true

  validates :category, inclusion: { in: %w[spam abuse other] }, allow_nil: true
end
