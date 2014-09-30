require 'mysql2-cs-bind'
module Shibuya
  class Db
    def initialize(params)
      Mysql2::Client.new(params)
    end
  end
end
