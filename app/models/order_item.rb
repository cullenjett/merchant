class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :order_id, :product_id, presence: true
  validates_numericality_of :quantity, :only_integer => true, :greater_than => 0

  def subtotal
    self.quantity * product.price
  end
end
