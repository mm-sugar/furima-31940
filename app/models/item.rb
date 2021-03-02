class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :category
    belongs_to :product_status
    belongs_to :shipping_burden
    belongs_to :prefecture
    belongs_to :shipping_days
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_status
    validates :shipping_burden
    validates :prefecture
    validates :shipping_days
  end


  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :product_status_id
    validates :shipping_burden_id
    validates :prefecture_id
    validates :shipping_days_id
  end
end
