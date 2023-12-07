class ShoppingCartsController < ApplicationController
  skip_before_action :verify_authenticity_token # skip CSRF token check since this is used as an API
  before_action :shopping_cart

  def show
    render json: {
      cart_items: shopping_cart.cart_items,
      total_cost: shopping_cart.total_cost
    }
  end

  def add_item
    item = Item.find(params[:item_id])
    cart_item = shopping_cart.add_item!(item)

    render json: {
      cart_items: shopping_cart.cart_items,
      total_cost: shopping_cart.total_cost
    }
  end

  def remove_item
    item = Item.find(params[:item_id])
    shopping_cart.remove_item!(item)

    render json: {
      cart_items: shopping_cart.cart_items,
      total_cost: shopping_cart.total_cost
    }
  end

  private

  def shopping_cart
    @shopping_cart ||= ShoppingCart.find_by(id: params[:id])
  end
end
