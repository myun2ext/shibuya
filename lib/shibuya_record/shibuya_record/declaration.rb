module ShibuyaRecord::Declaration
  def attributes(*list)
    if list
      @attributes = list
      attr_accessor *list
    else
      @attributes
    end
  end

  def record_attributes
    @attributes
  end
end
