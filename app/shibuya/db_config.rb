module Shibuya::DbConfig
  def self.db_config
    {
      driver: "mysql2-cs-bind",
      host: "localhost",
      username: "root",
      database: "shibuya_development"
    }
  end
end
