require 'sinatra'
require 'sinatra/json'

$:.unshift File.dirname(__FILE__)
$:.unshift File.expand_path('./lib/shibuya_record/', File.dirname(__FILE__))
require 'shibuya_record'

require './app/shibuya/controllers/authentication'
require './app/shibuya/db_config'
require './app/shibuya/modules'

module Shibuya
  module Application
    class Base < Sinatra::Base
      include AssetsRouter

      configure do
        enable :logging
        file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
        file.sync = true
        use Rack::CommonLogger, file
        ShibuyaRecord.configure { |conf| conf.db_connection_settings = Shibuya::DbConfig.db_config }
      end
    end
  end
end
