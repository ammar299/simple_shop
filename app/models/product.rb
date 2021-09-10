class Product < ApplicationRecord
  belongs_to :region

  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
  has_many :store_products, dependent: :destroy
  has_many :stores, through: :store_products
end
