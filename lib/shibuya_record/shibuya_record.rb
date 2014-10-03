module ShibuyaRecord
  module Query; end
end

require 'shibuya_record/base'
require 'shibuya_record/configuration'

module ShibuyaRecord
  @@configuration = ShibuyaRecord::Configuration.new

  def self.configure(&block)
    block.call(@@configuration)
  end

  def self.configuration
    @@configuration
  end
end
