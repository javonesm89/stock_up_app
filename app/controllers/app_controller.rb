class AppController < Sinatra::Base
    
    configure do
        enable :sessions
        set :session_secret, "diwali"

        set :views, 'app/views'
    end
    
    get '/' do
        erb :index
    end

    
    # move to learn controller once done
    get '/learn' do
        erb :'learn/learn'
    end
end
