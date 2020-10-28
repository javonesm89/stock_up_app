class Investor < ActiveRecord::Base
    has_secure_password

    has_many :orders
    has_many :stocks, as: :stock_order

    # After an investor has been create, run this method
    after_initialize :init

    def init(account_balance=1500)
        self.account_balance = account_balance
    end
end
