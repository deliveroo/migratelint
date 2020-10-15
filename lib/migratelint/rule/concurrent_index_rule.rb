module MigrateLint
  module Rule
    class ConcurrentIndexRule < Base
      class << self
        def check(sql)
          statement_tree = get_statement_tree(sql)
          return unless statement_tree[PgQuery::INDEX_STMT]
          if !statement_tree[PgQuery::INDEX_STMT]["concurrent"]
            raise FailedRuleError.new(sql), "Indexes must be created with CONCURRENTLY."
          end
        end
      end
    end
  end
end
