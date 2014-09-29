require 'sinatra'

module Shibuya
  class App < Sinatra::Base
    get '/' do
      'Hello world!'
    end
  end
end
