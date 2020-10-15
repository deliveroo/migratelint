module MigrateLint
  module Rule
    class NoVacuumFullRule < Base
      class << self
        def check(sql)
          statement_tree = get_statement_tree(sql)
          return unless statement_tree[PgQuery::VACUUM_STMT]
          if statement_tree[PgQuery::VACUUM_STMT]['options'] == 17
            raise FailedRuleError.new(sql), "A full vacuum is unsafe."
          end
        end
      end
    end
  end
end
