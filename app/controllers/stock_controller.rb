class StockController < AppController
    get '/stocks' do
        @stocks = Stock.collect_stocks
        erb :'stock/index'
    end

    get '/stocks/:id' do
        @stock = Stock.find_by(id: params[:id])
        
        erb :'/stock/show'
    end
end