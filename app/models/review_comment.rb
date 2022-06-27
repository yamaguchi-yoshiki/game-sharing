class ReviewComment < ApplicationRecord
  validates :comment, length: { minimum:2, maximum: 200 }

  belongs_to :customer
  belongs_to :review
end
