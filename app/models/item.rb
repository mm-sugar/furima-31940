class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: {maximum: 40}
    validates :description, length: {maximum: 1000}
    validates :price, inclusion: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :category
    belongs_to :product_status
    belongs_to :shipping_burden
    belongs_to :prefecture
    belongs_to :shipping_days
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :product_status_id
    validates :shipping_burden_id
    validates :prefecture_id
    validates :shipping_days_id
  end

end
