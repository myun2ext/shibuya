class ShibuyaRecord::Configuration::ConnectionSettings
  attr_accessor :driver, :database, :host, :username, :password

  def initialize(params)
    @driver = params[:driver]
    @database = params[:database]
    @host = params[:host]
    @username = params[:username]
    @password = params[:password]
  end

  alias adapter driver

  def to_hash
    {
      database: database,
      host: host,
      username: username,
      password: password
    }
  end
end
