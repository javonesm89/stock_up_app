class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |g|
      g.string :order_name
      g.integer :investor_id
      g.timestamps
    end
  end
end
