class StockController < AppController
    get '/stocks' do
        @stocks = Stock.all
    end
end