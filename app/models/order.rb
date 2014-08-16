class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  has_many :products

  def total
    subtotals = []
    order_items.each do |item|
      subtotals << item.subtotal
    end
    subtotals.inject(&:+)
  end
end
