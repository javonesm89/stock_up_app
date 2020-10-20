class OrderController < AppController
    get '/orders/new' do
        erb :'/order/new'
    end
end