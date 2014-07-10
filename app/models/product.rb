class Product < ActiveRecord::Base

  validates_presence_of :title, :description, :price, message: "all fields need to be completed"
  has_many :orders, through: :order_items
  has_many :order_items
end

