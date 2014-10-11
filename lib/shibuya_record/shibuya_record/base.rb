require 'shibuya_record/db_connection'
require 'shibuya_record/default_connection'
require 'shibuya_record/declaration'
require 'shibuya_record/finder'
require 'shibuya_record/string_util'

class ShibuyaRecord::Base
  extend ShibuyaRecord::Declaration
  extend ShibuyaRecord::Finder

  def initialize(params)
    self.class.record_attributes.each do |attribute|
      value = params[attribute.to_s] || params[attribute]
      self.send(attribute.to_s + "=", value)
    end
  end

  def self.table_name
    ShibuyaRecord::StringUtil.underscore(name) + "s"
  end

  def self.db_connection
    @@db_connection ||= ShibuyaRecord::DefaultConnection.connection
  end

  def db_connection
    @db_connection ||= self.class.db_connection
  end
end
