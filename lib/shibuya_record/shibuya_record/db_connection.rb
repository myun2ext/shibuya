require 'shibuya_record/adapter'

class ShibuyaRecord::DbConnection
  def initialize(*connection)
    if !connection.nil? and connection != []
      @connection = connection
    else
      @connection = ShibuyaRecord::DbConnection.created_by_default_settings
    end
  end

  def self.created_by_default_settings
    config = ShibuyaRecord::Configuration.connection_settings
    ShibuyaRecord::Adapter.new(config.adapter, config)
  end

  def connection
    @connection
  end

  def query(query_string, params)
    connection.query(query_string, params)
  end
end
