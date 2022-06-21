class Tag < ApplicationRecord
  validates :name, length: { minimum: 1, maximum: 20 }, uniqueness: true

  has_many :game_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :games, through: :game_tags
end
