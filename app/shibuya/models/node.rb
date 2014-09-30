module Shibuya
  class Node
    attr_reader :id, :parent_node_id, :name, :color, :screen_name, :created_at

    def initialize(params)
      @id = params[:id]
      @parent_node_id = params[:parent_node_id]
      @name = params[:name]
      @color = params[:color]
      @screen_name = params[:screen_name]
      @created_at = params[:created_at]
    end
  end
end
