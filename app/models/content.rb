class Content < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  include RankedModel
  ranks :row_order , with_same: :user_id 
  
  validates :name, :price, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ },
                    numericality: { only_integer: true, greater_than: 0, less_than: 1_000_000 }
  validates :name, length: { maximum: 20 }
end
