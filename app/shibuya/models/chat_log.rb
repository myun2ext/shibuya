module Shibuya
  class ChatLog < ShibuyaRecord::Base
    attributes :id, :node_id, :user_id, :text, :created_at
  end
end
