# change to sessions controller once done

class InvestorController < AppController

    get '/account' do
        @investor = Investor.find_by_id(session[:investor_id])
        @investor.adjust_account_balance
        erb :'/investor/account'
    end

end