class SessionController < AppController
    enable :sessions

    get '/signup' do
        erb :'/investor/signup'
    end

    post '/signup' do
        flash[:notice] = "Successfully created an account!"
        if params[:password] != '' && params[:username] != ''
            investor = Investor.create(params)
            flash[:notice]
            redirect to '/login'
        else
            redirect to 'signup'
        end
    end
    
    get '/login' do
        @session
        erb :'/investor/login'
    end
    
    post '/login' do
        investor = Investor.find_by(username: params[:username])
        if investor && investor.authenticate(params[:user_pass])
            session[:investor_id] = investor.id
            redirect to '/welcome'
        else
            redirect to '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect to '/'
    end
end