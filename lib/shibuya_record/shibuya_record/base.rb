require 'shibuya_record/declaration'

class ShibuyaRecord::Base
  extend ShibuyaRecord::Declaration

  def initialize(params)
    self.class.record_attributes.each do |attribute|
      value = params[attribute.to_s] || params[attribute]
      self.send(attribute.to_s + "=", value)
    end
  end
end
