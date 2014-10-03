class ShibuyaRecord::DefaultConnection
  def initialize(connection)
    @connection = connection
  end

  def connection
    @connection || DefaultConnection.connection
  end

  def self.connection=(connection)
    @@connection = connection
  end

  def self.connection
    @@connection ||= ShibuyaRecord::DbConnection.new
  end
end
