class Platform < ApplicationRecord
  validates :name, length: { minimum: 2, maximum: 20 }

  has_many :games, dependent: :destroy
end
