require 'sinatra'
require 'sinatra/json'

$:.unshift File.dirname(__FILE__)
$:.unshift File.expand_path('./lib/shibuya_record/', File.dirname(__FILE__))
require 'shibuya_record'

module Shibuya
  module Application
    class Base < Sinatra::Base
      configure do
        enable :logging
        file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
        file.sync = true
        use Rack::CommonLogger, file
      end
    end
  end
end
