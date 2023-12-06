# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

CartItem.destroy_all
Item.destroy_all
ShoppingCart.destroy_all

10.times do |i|
  Item.create(name: "Item #{i}", description: "Description #{i}", price: i)
end

# tests

shopping_cart = ShoppingCart.create

selected_items = Item.all.sample(3)

shopping_cart.add_item!(selected_items[0])
shopping_cart.add_item!(selected_items[0])
shopping_cart.add_item!(selected_items[0])
shopping_cart.remove_item!(selected_items[0])

shopping_cart.add_item!(selected_items[1])
shopping_cart.remove_item!(selected_items[1])

shopping_cart.add_item!(selected_items[2])

pp CartItem.where(shopping_cart:, item: selected_items[0]).count == 1
pp CartItem.find_by(shopping_cart:, item: selected_items[0]).quantity == 2
pp CartItem.where(shopping_cart:, item: selected_items[1]).count == 0
pp CartItem.where(shopping_cart:, item: selected_items[2]).count == 1
pp CartItem.find_by(shopping_cart:, item: selected_items[2])&.quantity == 1

