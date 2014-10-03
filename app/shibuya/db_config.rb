module Shibuya::DbConfig
  def self.db_config
    {
      host: "localhost",
      username: "root",
      database: "shibuya_development"
    }
  end
end
