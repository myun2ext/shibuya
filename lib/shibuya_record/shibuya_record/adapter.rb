module ShibuyaRecord::Adapters; end
class ShibuyaRecord::Adapter
  def self.get(type, params)
    case type
    when "mysql2-cs-bind"
      require 'shibuya_record/adapters/mysql2_cs_bind'
      Object.const_get("ShibuyaRecord::Adapters::Mysql2CsBind").new(params)
    end
  end

  def self.new(type, params)
    ShibuyaRecord::Adapter.get(type, params)
  end
end
