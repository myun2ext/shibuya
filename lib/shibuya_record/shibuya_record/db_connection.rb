class ShibuyaRecord::DbConnection
  def initialize(*connection)
    if connection
      @connection = connection
    else
      @connection = DbConnection.created_by_default_settings
    end
  end

  def self.created_by_default_settings
    config = ShibuyaRecord::Configuration.connection_settings
    Adapter.new(config.adapter, config)
  end

  def connection
    @connection
  end
end
