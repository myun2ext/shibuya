module Shibuya
  class Db
    module Query
      class Insert
        attr_reader :query, :values

        def initialize(table, params)
          @values = []
          @query = "INSERT INTO #{table} ("

          @query += params[:values].map { |key, value|
            @values << value
            key
          }.join(", ")

          @query += ") VALUES ("
          @query += "?, " * (params[:values].length - 1) + "?"
          @query += ")"
        end
      end
    end
  end
end
