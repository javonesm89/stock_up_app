class Stock < ActiveRecord::Base
    belongs_to :order
    belongs_to :stock_order, polymorphic: true

    def self.collect_stocks
        @stocks = []
        self.all.each do |stock|
            if stock.stock_order_type != "Order"
                @stocks << stock
            end
        end
        @stocks
    end
    
end