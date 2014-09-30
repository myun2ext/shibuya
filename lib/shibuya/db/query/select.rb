module Shibuya
  module Db
    module Query
      module Select
        attr_reader :query, :params

        def initialize(table, params)
          @params = []
          @query = "SELECT * FROM #{table}"

          if params[:where]
            @query += " WHERE "
            conditions = params[:where]
            conditions = [conditions] unless conditions.is_a? Array
            conditions.map do |where|
              where.gsub!(/:[\w]+/) do
                @params += $1
                params[$1]
              end
            end

            @query += conditions.join(" AND ")
          end
        end
      end
    end
  end
end
