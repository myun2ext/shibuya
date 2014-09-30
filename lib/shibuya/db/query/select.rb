module Shibuya
  class Db
    module Query
      class Select
        attr_reader :query, :params

        def initialize(table, params)
          @params = []
          @query = "SELECT * FROM #{table}"

          if params[:where]
            @query += " WHERE "
            conditions = params[:where]
            conditions = [conditions] unless conditions.is_a? Array
            conditions.map do |where|
              where.gsub!(/:([\w]+)/) do
                @params << params[$1.to_sym]
                "?"
              end
            end

            @query += conditions.join(" AND ")
          end
        end
      end
    end
  end
end
