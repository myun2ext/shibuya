require 'shibuya_record/query_generator/where'
require 'shibuya_record/query_generator/select'

module ShibuyaRecord::Finder
  def try_find_method(method_name, value)
    if method_name =~ /\Afind_by_([\w]+)\z/
      find_by($1, value)
    else
      super
    end
  end

  def self.find_by(key, value)
    result = Query::Select.new(
      table_name,
      where: { key.to_sym => value })

    return nil if result.nil? or result.count == 0
    self.class.new(result.first)
  end

  def self.find(value)
    find_by(:id, value)
  end
end
