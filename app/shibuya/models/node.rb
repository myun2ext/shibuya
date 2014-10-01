module Shibuya
  class Node
    attr_accessor :id, :parent_node_id, :name, :color, :screen_name, :created_at

    def initialize(params)
      @id = params["id"]
      @parent_node_id = params["parent_node_id"]
      @name = params["name"]
      @color = params["color"]
      @screen_name = params["screen_name"]
      @created_at = params["created_at"]
    end

    def path
      name.downcase.gsub(" ", "_")
    end
    alias id_name path

    def to_hash
      ary = instance_variables.map { |name|
        key = name.to_s.slice(1..-1)
        value = instance_variable_get(name)
        [key, value]
      }
      Hash[*ary.flatten]
    end

    def self.children(id, db_connection)
      result = db_connection.select(
        :nodes,
        where: "parent_node_id = :parent_node_id",
        parent_node_id: id)
      result.map { |node| Node.new(node) }
    end

    def self.find_by_name(name, db_connection)
      result = db_connection.select(
        :nodes,
        where: "name = :name",
        name: name)
      return nil if result.nil? or result.count == 0
      Node.new(result.first)
    end

    def self.find(id, db_connection)
      result = db_connection.select(
        :nodes,
        where: "id = :id",
        id: id)
      return nil if result.nil? or result.count == 0
      Node.new(result.first)
    end

    def self.find_by_name_of_children(parent_id, name, db_connection)
      result = db_connection.select(
        :nodes,
        where: ["parent_node_id = :parent_node_id", "name = :name"],
        parent_node_id: parent_id, name: name)
      return nil if result.nil? or result.count == 0
      Node.new(result.first)
    end
  end
end
