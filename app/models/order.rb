class Order < ActiveRecord::Base
	belongs_to :user
	has_many :products, through: :order_items
	has_many :order_items, dependent: :destroy

	validates :order_id, :product, presence: true
    validates :quantity, numericality: { only_integer: true, greater_than: 0 }

 def total
    order_items.map(&:subtotal).sum
  end
end
