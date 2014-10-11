module Shibuya::Authentication
  def self.included(k)
    k.use Rack::Session::Cookie, secret: session_key
  end

  private
  def session_key
  end
end
