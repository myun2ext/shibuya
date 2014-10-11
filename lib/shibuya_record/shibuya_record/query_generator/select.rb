class ShibuyaRecord::Query::Select
  attr_reader :query, :values

  def initialize(table, params)
    @values = []
    @query = "SELECT * FROM #{table}"

    if params[:where]
      where_query = ShibuyaRecord::Query::Where.new(params[:where])
      @query += where_query.query
      @values += where_query.values
    end
  end
end
