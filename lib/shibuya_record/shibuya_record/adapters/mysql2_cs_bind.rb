require 'mysql2-cs-bind'

class ShibuyaRecord::Adapters::Mysql2CsBind
  attr_reader :driver

  def initialize(setting)
    @driver = Mysql2::Client.new(setting.to_hash)
  end

  def query(query_string, *params)
    driver.xquery(query_string, params)
  end
end
