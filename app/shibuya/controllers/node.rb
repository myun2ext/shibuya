module Shibuya
  module Controllers
    class Node
      helpers do
        def fetch_root_node
          name = "Tokyo"
          @root_node = Node.find_by_name_of_children(nil, name)
        end

        def fetch_node_path
          path = params[:captures].first.split("/")
          @node_path = []
          path.each do |name|
            if @node_path.length == 0
              node = Node.find_by_name(name)
            else
              node = Node.find_by_name_of_children(@node_path.last.id, name)
            end
            if node == nil
              return erb :not_found_node
            end
            @node_path << node
          end
          @node = @node_path.last
          @latest_node = @node
          @nodes = Node.children(@node.id)
        end
      end

      get %r{\A/(nodes/?)?\z} do
        @node = Node.find(1)
        @nodes = Node.children(1)
        @latest_node = @node
        @node_path = []
        erb :nodes
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
end
