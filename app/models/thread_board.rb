class ThreadBoard < ApplicationRecord
  validates :title, length: { minimum: 1, maximum: 100 }, uniqueness: true
  validates :introduction, length: { maximum: 300 }

  belongs_to :game
  has_many :thread_messages, dependent: :destroy, foreign_key: 'thread_id'
end
