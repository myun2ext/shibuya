module Shibuya
  module Db
    module Query
      module Select
        attr_reader :query

        def initialize(table, params)
          @query = "SELECT * FROM #{table}"

          if params[:where]
            @query += " WHERE "
            conditions = params[:where]
            conditions = [conditions] unless conditions.is_a? Array
            conditions.map { |where| where.gsub!(/:[\w]+/) { params[$1] } }

            @query += conditions.join(" AND ")
          end
        end
      end
    end
  end
end
