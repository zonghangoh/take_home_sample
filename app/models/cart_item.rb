class CartItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :item

  attribute :quantity, :integer, default: 0
end
