class Review < ApplicationRecord
  validates :rate, numericality: { less_than_or_equal_to: 10, greater_than_or_equal_to: 1 }, presence: true
  validates :comment, length: { maximum: 200 }

  belongs_to :customer
  belongs_to :game
  has_many :sympathies, dependent: :destroy
  has_many :review_comments, dependent: :destroy

  def sympathied_by?(customer)
    sympathies.where(customer_id: customer.id).exists?
  end
end
