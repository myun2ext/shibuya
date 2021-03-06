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

  def method_missing(method, *args)
    try_find_method(method, args)
  end

  def find_by(key, value)
    result = select(key.to_sym => value)
    return nil if result.nil? or result.count == 0
    new(result.first)
  end

  def find(value)
    find_by(:id, value)
  end

  def select(conditions)
    q = ShibuyaRecord::Query::Select.new(
      table_name,
      where: conditions)
    self.db_connection.query(q.query, q.values)
  end
end
