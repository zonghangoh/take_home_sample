class ShoppingCart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  def add_item(item)
    cart_items.find_or_create_by(item: item).increment(:quantity)
  end

  def remove_item(item)
    cart_item = cart_items.find_by(item: item)
    if cart_item&.quantity >= 1
      cart_item.decrement(:quantity)
      cart_item.destroy if cart_item.quantity.zero?
    end
  end

  def total_cost
    cart_items.sum { |cart_item| cart_item.quantity * cart_item.item.price }
  end
end
