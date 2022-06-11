class ReviewComment < ApplicationRecord
  validates :comment, length: { maximum: 200 }

  belongs_to :customer
  belongs_to :review
end
