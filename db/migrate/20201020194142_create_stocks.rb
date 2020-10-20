class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |g|
      g.string :name
      g.string :symbol
      g.integer :stock_price
    end
  end
end
