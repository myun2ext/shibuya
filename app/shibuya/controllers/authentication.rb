module Shibuya
  module Controllers
    class Authentication
      configure do
        enable :sessions
      end

      get '/login' do
        erb :login
      end

      post '/login' do
        session[:user_name] = params[:name]
        p session[:user_name]
        redirect to("/")
      end
    end
  end
end
