require 'sinatra'
require 'sinatra/json'

$:.unshift File.dirname(__FILE__)
$:.unshift File.expand_path('./lib/shibuya_record/', File.dirname(__FILE__))

require 'shibuya_record'

require './app/shibuya/models/node'
require './app/shibuya/models/chat_log'
require './app/shibuya/db_config'
require './app/shibuya/modules'

module Shibuya
  class App < Sinatra::Base
    include AssetsRouter

    configure do
      enable :logging
      file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
      file.sync = true
      use Rack::CommonLogger, file
      enable :sessions
      ShibuyaRecord.configure { |conf| conf.db_connection_settings = Shibuya::DbConfig.db_config }
    end

    helpers do
      def fetch_root_node
        name = "Tokyo"
        @root_node = Node.find_by_name_of_children(nil, name, db_connection)
      end

      def fetch_node_path
        path = params[:captures].first.split("/")
        @node_path = []
        path.each do |name|
          if @node_path.length == 0
            node = Node.find_by_name(name, db_connection)
          else
            node = Node.find_by_name_of_children(@node_path.last.id, name, db_connection)
          end
          if node == nil
            return erb :not_found_node
          end
          @node_path << node
        end
        @node = @node_path.last
        @latest_node = @node
        @nodes = Node.children(@node.id, db_connection)
      end
    end

    get %r{\A/(nodes/?)?\z} do
      @node = Node.find(1)
      @nodes = Node.children(1, db_connection)
      @latest_node = @node
      @node_path = []
      erb :nodes
    end

    get '/about' do
      erb :about
    end

    get '/favorites' do
      erb :favorites
    end

    get '/login' do
      erb :login
    end

    post '/login' do
      session[:user_name] = params[:name]
      p session[:user_name]
      redirect to("/")
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

    # post
    post '/nodes/?' do
      @node = Node.new(params)
      @node.parent_node_id = 1
      @node.insert!(db_connection)
      redirect to('/nodes/')
    end

    # put
    post %r{\A/nodes/([\w/]+)\z} do
      fetch_node_path
      if params[:_method] == "put" || params[:_method] == "PUT"
        @node.name = params[:name]
        @node.color = params[:color]
        @node.save(db_connection)
        redirect to("/nodes" + ("/" + params[:captures].first).gsub(/\A(.*)\/.+\z/, '\1'))
      else
        @node = Node.new(params)
        @node.parent_node_id = (@latest_node.id || 1)
        @node.insert!(db_connection)
        redirect to("/nodes/" + params[:captures].first)
      end
    end

    # get
    get %r{\A/nodes/([\w/]+)(.json)?\z} do
      fetch_node_path
      if params[:captures][1] == ".json"
        json @node.to_hash
      else
        erb :nodes
      end
    end
  end
end
