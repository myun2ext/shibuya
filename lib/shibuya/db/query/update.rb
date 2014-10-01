module Shibuya
  class Db
    module Query
      class Update
        attr_reader :query, :values

        def initialize(table, params)
          @values = []
          @query = "UPDATE #{table} SET "

          @query += params[:set].map { |key, value|
            @values << value
            "#{key} = ?"
          }.join(", ")

          if params[:where]
            @query += " WHERE "
            @query += params[:where].map { |key, value|
              @values << value
              "#{key} = ?"
            }.join(" AND ")
          end
        end
      end
    end
  end
end
