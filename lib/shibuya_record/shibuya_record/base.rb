require 'shibuya_record/declaration'
require 'shibuya_record/finder'

class ShibuyaRecord::Base
  extend ShibuyaRecord::Declaration
  include ShibuyaRecord::Finder

  def initialize(params)
    self.class.record_attributes.each do |attribute|
      value = params[attribute.to_s] || params[attribute]
      self.send(attribute.to_s + "=", value)
    end
  end
end
