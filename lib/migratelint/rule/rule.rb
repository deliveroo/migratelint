module MigrateLint
  module Rule
    class Base
      class << self
        def parse(sql)
          return PgQuery.parse(sql)
        end

        def get_statement_trees(sql)
          return parse(sql).tree.map { |t| t[PgQuery::RAW_STMT]['stmt'] }
        end

        def check(sql)
          raise NotImplementedError
        end
      end
    end
  end
end
