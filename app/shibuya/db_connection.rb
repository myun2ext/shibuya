require './lib/shibuya/db'

module Shibuya::DbConnection
  def db_connection
    Thread.current[:db_connection] ||= Shibuya::Db.new(db_config)
  end

  private
  def db_config
    {
      host: "localhost",
      username: "root",
      database: "shibuya_development"
    }
  end
end
