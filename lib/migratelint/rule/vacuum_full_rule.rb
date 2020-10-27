module MigrateLint
  module Rule
    class NoVacuumFullRule < Base
      class << self
        def check(sql)
          get_statement_trees(sql).each do |statement_tree|
            next unless statement_tree[PgQuery::VACUUM_STMT]
            if statement_tree[PgQuery::VACUUM_STMT]['options'] == 17
              raise FailedRuleError.new(sql), "A full vacuum is unsafe."
            end
          end
        end
      end
    end
  end
end
