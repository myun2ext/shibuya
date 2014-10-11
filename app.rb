require './application_base'
require './app/shibuya/models/node'
require './app/shibuya/models/chat_log'
require './app/shibuya/controllers/node'
require './app/shibuya/controllers/chat_log'
require './app/shibuya/controllers/authentication'
require './app/shibuya/db_config'
require './app/shibuya/modules'

module Shibuya
  class App < Application::Base
    include AssetsRouter

    configure do
      ShibuyaRecord.configure { |conf| conf.db_connection_settings = Shibuya::DbConfig.db_config }
    end

    routing do
    end
  end
end
