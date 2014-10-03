module ShibuyaRecord::Declaration
  def attributes(*list)
    @attributes = list
    attr_accessor *list
  end
end
