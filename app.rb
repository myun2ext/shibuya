require './application_base'

require './app/shibuya/models/node'
require './app/shibuya/models/chat_log'
require './app/shibuya/controllers/node'
require './app/shibuya/controllers/chat_log'

module Shibuya
  class App < Application::Base
  end
end
