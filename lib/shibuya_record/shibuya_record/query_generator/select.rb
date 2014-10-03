class ShibuyaRecord::Query::Select
  attr_reader :query, :values

  def initialize(table, params)
    @values = []
    @query = "SELECT * FROM #{table}"

    if params[:where]
      where = ShibuyaRecord::Query::Where.new(params)
      @values += where.values
      @query += where.query
    end
  end
end
