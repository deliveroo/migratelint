module MigrateLint
  module Rule
    class Base
      class << self
        def parse(sql)
          return PgQuery.parse(sql)
        end

        def get_statement_tree(sql)
          return parse(sql).tree.first[PgQuery::RAW_STMT]['stmt']
        end

        def check(sql)
          raise NotImplementedError
        end
      end
    end
  end
end
