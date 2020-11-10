class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |g|
      g.string :name
      g.string :symbol
      g.float :price
      g.integer :stock_order_id
      g.string :stock_order_type
      g.timestamps
    end
  end
end
