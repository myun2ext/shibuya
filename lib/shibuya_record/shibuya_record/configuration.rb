class ShibuyaRecord::Configuration; end

require 'shibuya_record/configuration/connection_settings'

class ShibuyaRecord::Configuration
  attr_reader :connection_settings
  @connection_settings = nil

  def initialize
  end

  def db_connection_settings=(params)
    @connection_settings = ConnectionSettings.new(params)
  end


  def self.connection_settings
    @@connection_settings ||= ShibuyaRecord.configuration.connection_settings
  end
end
