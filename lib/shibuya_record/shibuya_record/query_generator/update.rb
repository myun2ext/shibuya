class ShibuyaRecord::QueryGenerator::Update
  attr_reader :query, :values

  def initialize(table, params)
    @values = []
    @query = "UPDATE #{table} SET "

    @query += params[:set].map { |key, value|
      @values << value
      "#{key} = ?"
    }.join(", ")

    if params[:where]
      where = Where.new(params)
      @query += where.query
      @values += where.values
    end
  end
end
