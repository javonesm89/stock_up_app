class AddInvestorIdColumnToOrdersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :investor_id, :integer
  end
end
