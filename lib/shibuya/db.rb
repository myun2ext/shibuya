require 'mysql2-cs-bind'
require './lib/shibuya/db/query/select'

module Shibuya
  class Db
    include Query::Select

    attr_reader :connection
    def initialize(params)
      @connection = Mysql2::Client.new(params)
    end

    def select(table, params)
      connection.xquery(Query::Select.new(table, params).query)
    end
  end
end
