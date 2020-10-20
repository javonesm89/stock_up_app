class LearnController < AppController
    get '/learn1' do
        erb :'learn/learn1'
    end

    get '/learn2' do
        erb :'learn/learn2'
    end

    get '/learn3' do
        erb :'learn/learn3'
    end
end

