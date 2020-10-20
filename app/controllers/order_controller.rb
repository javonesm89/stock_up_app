class OrderController < AppController
    get '/orders' do
        @orders = Order.all
        erb :'/order/index'
    end

    get '/orders/:id' do
        @order = Order.find_by_id(params[:id])

        @stock = Stock.find_by_id(@order.stock_id)
        
        erb :'/order/show'
    end
end