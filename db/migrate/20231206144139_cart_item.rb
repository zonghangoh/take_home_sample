class CartItem < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.references :shopping_cart, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :quantity
    end
  end
end
