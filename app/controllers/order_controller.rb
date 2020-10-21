class OrderController < AppController
    get '/orders' do
        @orders = Order.all
        erb :'/order/index'
    end

    post '/orders' do
        order = Order.new(params)
        order.investor_id = session[:investor_id]
        order.save
        redirect to '/account'
    end
    
    get '/orders/new' do
        @stocks = Stock.all
        erb :'/order/new'
    end
    
    get '/orders/:id/edit' do
        @order = Order.find_by_id(params[:id])
        erb :'/order/edit'
    end
    
    get '/orders/:id' do
        # make into find_by method too much DRY
        @order = Order.find_by_id(params[:id])
        @stock = Stock.find_by_id(@order.stock_id)
        erb :'/order/show'
    end

    patch '/orders/:id' do
        raise params.inspect
    end
end