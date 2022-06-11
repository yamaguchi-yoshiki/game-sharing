class Game < ApplicationRecord
  validates :title, length: { minimum: 1, maximum: 100 }, uniqueness: true
  validates :introduction, length: { maximum: 300 }
  validates :release_date, length: { maximum: 11 }
  validates :no_tax_price, numericality: {only_integer: true}
  validates :related_url, length: { maximum: 250 }

  belongs_to :platform
  has_many :reviews, dependent: :destroy
  has_many :thread_boards, dependent: :destroy
  has_many :game_tags, dependent: :destroy
  has_many :tags, through: :game_tags
end
