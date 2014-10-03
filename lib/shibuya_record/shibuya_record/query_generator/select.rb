class ShibuyaRecord::QueryGenerator::Select
  attr_reader :query, :values

  def initialize(table, params)
    @values = []
    @query = "SELECT * FROM #{table}"

    if params[:where]
      where = Where.new(params)
      @values += where.values
      @query += where.query
    end
  end
end
