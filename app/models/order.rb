class Order < ActiveRecord::Base
    belongs_to :investor
    has_many :stocks, as: :stock_order
    
    def order_total
        total_price = 0
        self.stocks.each do |stock|
            total_price += stock.price
        end
        total_price
        # binding.pry
    end
    
    def add_stocks(params)
        stock = Stock.all.find_by_id(params["stock_id"])
        self["order_name"] = stock.name
        shares = params["num_of_shares"].to_i
        shares.times do
            self.stocks <<  Stock.new(name: stock.name, symbol: stock.symbol, price:stock.price)
        end
        binding.pry
        self.save
        self
    end
    
    
    def update_order(params)
        params["order"]["stock_ids"].each do |stock_id|
            stock = stock_id.to_i
            find_stock = self.stocks.find(stock)
            self.stocks.each do |stock|
                if stock == find_stock
                    self.stocks.delete(find_stock)
                end
            end
        end
        self
    end

    
end