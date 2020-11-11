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
        bag = []
        self.orders.each do |order|
            bag << order.order_total
                self.account_balance -= bag.sum
            end
            self.account_balance
    end
end
