require 'mysql2-cs-bind'
require './lib/shibuya/db/query/select'

module Shibuya
  class Db
    attr_reader :connection
    def initialize(params)
      @connection = Mysql2::Client.new(params)
    end

    def select(table, params)
      q = Query::Select.new(table, params)
      connection.xquery(q.query, q.params)
    end
  end
end
