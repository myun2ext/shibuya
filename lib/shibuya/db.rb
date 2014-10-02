require 'mysql2-cs-bind'
require './lib/shibuya/db/query/select'
require './lib/shibuya/db/query/update'

module Shibuya
  class Db
    attr_reader :connection
    def initialize(params)
      @connection = Mysql2::Client.new(params)
    end

    def select(table, params)
      q = Query::Select.new(table, params)
      p q.query
      p q.params
      connection.xquery(q.query, q.params)
    end

    def insert(table, params)
      q = Query::Insert.new(table, params)
      p q.query
      p q.values
      connection.xquery(q.query, q.values)
    end

    def update(table, params)
      q = Query::Update.new(table, params)
      p q.query
      p q.values
      connection.xquery(q.query, q.values)
    end
  end
end
