require 'sinatra'

module Shibuya
  class App < Sinatra::Base
    get '/' do
      File.read(File.join('public', 'html', 'index.html'))
    end
  end
end
