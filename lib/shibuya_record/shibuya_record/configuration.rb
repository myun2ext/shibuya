class ShibuyaRecord::Configuration; end

require 'shibuya_record/configuration/connection_settings'

class ShibuyaRecord::Configuration
  @connection_settings = nil

  def initialize
  end

  def db_connection_settings=(params)
    @connection_settings = ConnectionSettings.new(params)
  end
end
