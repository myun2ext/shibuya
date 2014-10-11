module Shibuya
  module Controllers
    class ChatLog
      get '/chat_logs/*' do
        fetch_node_path
        erb :chat_log
      end

      post '/chat_logs/*' do
        fetch_node_path
        post_chat
        redirect to('/chat_logs/' + params[:splat])
      end
    end
  end
end
