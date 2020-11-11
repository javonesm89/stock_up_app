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
        flash[:notice] = "Successfully created an order!"
        if params["num_of_shares"] == ''
            redirect to 'orders/new'
        end
        order = Order.new()
        order.investor_id = session["investor_id"]
        order.add_stocks(params)
        flash[:notice]
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
        erb :'/order/show'
    end
    
    get '/orders/fail' do 
        flash[:warning] = "Unable to complete order. Insufficient funds!"
        erb :'/orders/fail'
    end
    
    patch '/orders/:id' do
        @order = Order.find_by_id(params[:id])
        @order.update_order(params)
        if @order.stocks.size != 0
            redirect to "/orders/#{@order.id}"
        else
            flash[:delete] = "Order has 0 shares and was therefore deleted!"
            @order.destroy
            redirect to '/orders'
        end
            
    end

    delete '/orders/:id' do
        @order = Order.find_by_id(params[:id])
        @order.destroy

        redirect to '/orders'
    end
end