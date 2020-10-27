module MigrateLint
  module Rule
    class NoExistingColumnAlterRule < Base
      class << self
        def check(sql)
          get_statement_trees(sql).each do |statement_tree|
            next unless statement_tree[PgQuery::ALTER_TABLE_STMT]
            cmds = statement_tree[PgQuery::ALTER_TABLE_STMT]["cmds"]
            cmds.each do |cmd|
              if cmd[PgQuery::ALTER_TABLE_CMD]['subtype'] == PgQuery::AT_AlterColumnType
                raise FailedRuleError.new(sql), "Type changes on existing columns are unsafe."
              end
            end
          end
        end
      end
    end
  end
end
