module ShibuyaRecord::Adapters; end
module ShibuyaRecord::Adapter
  def initialize(type, params)
    case type
    when "mysql2-cs-bind"
      require 'shibuya_record/adapters/mysql2_cs_bind'
      Object.const_get("ShibuyaRecord::Adapters::Mysql2CsBind").new(params)
    end
  end
end
