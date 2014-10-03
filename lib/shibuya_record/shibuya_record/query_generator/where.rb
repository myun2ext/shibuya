class ShibuyaRecord::Query::Where
  attr_reader :query, :values

  def initialize(conditions)
    @values = []

    @query = " WHERE "
    @query += params[:where].map { |key, value|
      @values << value
      "#{key} = ?"
    }.join(" AND ")
  end
end
