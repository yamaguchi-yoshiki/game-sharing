class ThreadMessage < ApplicationRecord
  validates :message, length: { minimum:2, maximum: 200 }

  belongs_to :customer
  belongs_to :thread_board
end
