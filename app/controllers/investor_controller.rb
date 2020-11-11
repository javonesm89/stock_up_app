# change to sessions controller once done

class InvestorController < AppController

    get '/welcome' do
        @investor = Investor.find_by_id(session[:investor_id])
        erb :'investor/welcome'
    end
    
    get '/account' do
        flash[:error] = "Unable to complete order. Insufficient funds!"
        @investor = Investor.find_by_id(session[:investor_id])
        if @investor.account_balance >= @investor.new_balance
            erb :'/investor/account'
        else
            @investor
            erb :'/order/fail'
        end
    end

end