module Shibuya
  class Node < ShibuyaRecord::Base
    attributes :id, :parent_node_id, :name, :color, :screen_name, :created_at

    def insert!(db_connection)
      db_connection.insert(:nodes,
        values: {
          parent_node_id: parent_node_id,
          name: name,
          color: color,
          created_at: Time.now,
        }
      )
    end

    def save(db_connection)
      db_connection.update(:nodes,
        where: { id: id },
        set: {
          name: name,
          color: color
        }
      )
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
