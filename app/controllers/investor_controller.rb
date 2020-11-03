# change to sessions controller once done

class InvestorController < AppController

    get '/welcome' do
        @investor = Investor.find_by_id(session[:investor_id])
        erb :'investor/welcome'
    end
    
    get '/account' do
        @investor = Investor.find_by_id(session[:investor_id])
        erb :'/investor/account'
    end

end