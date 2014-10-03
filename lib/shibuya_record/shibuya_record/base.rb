require 'shibuya_record/declaration'

class ShibuyaRecord::Base
  extend ShibuyaRecord::Declaration

  def initialize(params)
    @attributes.each do |attribute_name|
      self.send(attribute_name + "=", params[attribute_name]) if params[attribute_name]
    end
  end
end
