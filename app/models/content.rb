class Content < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :price, presence: true
  validates :price,format: { with: /\A[0-9]+\z/ },
  numericality: { only_integer: true,greater_than: 0, less_than: 1000000}
  validates :name, length: { maximum: 20 }
end
