module MigrateLint
  module Rule
    class ConcurrentIndexRule < Base
      class << self
        def check(sql)
          get_statement_trees(sql).each do |statement_tree|
            next unless statement_tree[PgQuery::INDEX_STMT]
            if !statement_tree[PgQuery::INDEX_STMT]["concurrent"]
              raise FailedRuleError.new(sql), "Indexes must be created with CONCURRENTLY."
            end
          end
        end
      end
    end
  end
end
