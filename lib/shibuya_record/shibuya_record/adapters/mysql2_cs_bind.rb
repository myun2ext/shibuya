class ShibuyaRecord::Adapters::Mysql2CsBind
  attr_reader :driver

  def initialize(params)
    @driver = Mysql2::Client.new(params)
  end

  def query(query_string, *params)
    driver.xquery(query_string, params)
  end
end
