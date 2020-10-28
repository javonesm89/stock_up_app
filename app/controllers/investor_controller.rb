# change to sessions controller once done

class InvestorController < AppController

    get '/welcome' do
        @investor = Investor.find_by_id(session[:investor_id])
        erb :'investor/welcome'
    end
    
    get '/account' do
        @investor = Investor.find_by_id(session[:investor_id])
        @investor.deduct_from_account_balance
        erb :'/investor/account'
    end

end