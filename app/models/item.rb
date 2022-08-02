class Item < ApplicationRecord

  has_many :customers
  has_many :customer_items
  has_many :customers, through: :customer_items
end