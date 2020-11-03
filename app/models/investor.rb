class Investor < ActiveRecord::Base
    has_secure_password

    has_many :orders
    has_many :stocks, as: :stock_order

    # After an investor has been create, run this method
    after_initialize :init

    def init(account_balance=2000)
        self.account_balance = account_balance
    end

    def new_balance
        self.account_balance -= self.orders.last.order_total 
        money_balance.round(2)
    end
end
