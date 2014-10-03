module Shibuya
  class Db
    module Query
      class Where
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
    end
  end
end
