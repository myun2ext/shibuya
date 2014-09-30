require 'sinatra'
require './lib/shibuya/db'
require './app/shibuya/models/node'

module Shibuya
  class App < Sinatra::Base
    configure do
      enable :logging
      file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
      file.sync = true
      use Rack::CommonLogger, file
    end

    helpers do
      def db_config
        {
          host: "localhost",
          username: "root",
          database: "shibuya_development"
        }
      end
      def db_connection
        Thread.current[:db_connection] ||= Shibuya::Db.new(db_config)
      end
    end

    get '/' do
      @nodes = Node.children(1, db_connection)
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
