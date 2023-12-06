class ShoppingCart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  def add_item!(item)
    cart_items.find_or_create_by(item:).increment(:quantity).save
  end

  def remove_item!(item)
    cart_item = cart_items.find_by(item: item)
    if cart_item.present? && cart_item.quantity >= 1
      cart_item.decrement(:quantity)
      if cart_item.quantity.zero?
        cart_item.destroy
      else
        cart_item.save
      end
    end
  end

  def total_cost
    cart_items.sum { |cart_item| cart_item.quantity * cart_item.item.price }
  end
end
