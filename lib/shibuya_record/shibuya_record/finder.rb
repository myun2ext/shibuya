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

  def find_by(key, value)
    q = ShibuyaRecord::Query::Select.new(
      table_name,
      where: { key.to_sym => value })
    result = self.db_connection.query(q.query, q.values)

    return nil if result.nil? or result.count == 0
    self.class.new(result.first)
  end

  def find(value)
    find_by(:id, value)
  end
end
