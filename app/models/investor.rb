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
        total = []
        self.orders.each do |order|
            total << order.order_total
        end
        total.sum.round(2)
    end
    
    def has_enough?
        if self.new_balance > self.account_balance
            does_have = self.new_balance - self.orders.last.order_total
            self.orders.last.destroy
        end
        does_have
    end



end
