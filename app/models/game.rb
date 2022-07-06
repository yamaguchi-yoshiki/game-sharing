class Game < ApplicationRecord
  validates :platform_id, presence: true
  validates :title, length: { minimum: 1, maximum: 100 }, uniqueness: true
  validates :introduction, length: { maximum: 300 }
  validates :release_date, length: { maximum: 11 }
  validates :no_tax_price, allow_blank: true, numericality: {only_integer: true}
  validates :related_url, length: { maximum: 250 }

  belongs_to :platform
  has_many :reviews, dependent: :destroy
  has_many :thread_boards, dependent: :destroy
  has_many :game_tags, dependent: :destroy
  has_many :tags, through: :game_tags

  has_one_attached :game_image

  def get_game_image
    (game_image.attached?) ? game_image : 'no_image.jpg'
  end
end
