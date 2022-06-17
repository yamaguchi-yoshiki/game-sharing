class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 200 }

  has_many :reviews, dependent: :destroy
  has_many :sympathies, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_many :thread_messages, dependent: :destroy

  def self.guest
    find_or_create_by!(name: 'ゲストユーザー' ,email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "ゲストユーザー"
    end
  end

  def active_for_authentication?
    super && (is_active == true)
  end
end
