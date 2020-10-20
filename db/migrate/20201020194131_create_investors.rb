class CreateInvestors < ActiveRecord::Migration[5.2]
  def change
    create_table :investors do |g|
      g.string :username
      g.string :password_digest
      g.integer :account_balance
    end
  end
end
