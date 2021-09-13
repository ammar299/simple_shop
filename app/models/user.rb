class User < ApplicationRecord
  rolify
  has_many :orders
  has_many :payments
end
