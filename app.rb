require 'sinatra'

module Shibuya
  class App < Sinatra::Base
    get '/' do
      erb :index
    end

    get '/login' do
      erb :login
    end

    get '/nodes/*' do
      erb :index
    end
  end
end
