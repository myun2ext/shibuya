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

      def fetch_node_path
        path = params[:splat].first.split("/")
        @node_path = []
        path.each do |name|
          if @node_path.length == 0
            node = Node.find_by_name(name, db_connection)
          else
            node = Node.find_by_name_of_children(@node_path.last, name, db_connection)
          end
          if node == nil
            return erb "404"
          end
          @node_path << node
        end
        @nodes = Node.children(@node_path.last.id, db_connection)
      end
    end

    get /\A\/(nodes\/?)?\z/ do
      @nodes = Node.children(1, db_connection)
      erb :index
    end

    get '/login' do
      erb :login
    end

    get '/chat_logs/*' do
      fetch_node_path
      erb :chat_log
    end

    post '/chat_logs/*' do
      fetch_node_path
      post_chat
      redirect to('/chat_logs/' + params[:splat])
    end

    get '/nodes/*/new' do
      fetch_node_path
      erb :new_node
    end

    post'/nodes/*' do
      fetch_node_path
      post_node
       redirect to('/nodes/' + params[:splat])
    end

    get '/nodes/*' do
      fetch_node_path
      erb :index
    end
  end
end
