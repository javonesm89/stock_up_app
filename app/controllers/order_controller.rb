class OrderController < AppController
    get '/orders' do
        @orders = []
        Order.all.each do |order| 
            if order.investor_id == session["investor_id"]
                @orders << order
            end
        end
        @orders
        erb :'/order/index'
    end

    post '/orders' do
        order = Order.new()
        order.investor_id = session["investor_id"]
        order.add_stocks(params)
        
        redirect to "/orders/#{order.id}"
    end
    
    get '/orders/new' do
        @stocks = Stock.collect_stocks
        erb :'/order/new'
    end
    
    get '/orders/:id/edit' do
        @order = Order.find_by_id(params[:id])
        erb :'/order/edit'
    end
    
    get '/orders/:id' do
        # make into find_by method too much DRY
        # create module for ClassMethods --> find method
        @order = Order.find_by_id(params[:id])
        binding.pry
        erb :'/order/show'
    end

    patch '/orders/:id' do
        @order = Order.find_by_id(params[:id])
        @order.update_order(params)
        redirect to "/orders/#{@order.id}"
    end
end