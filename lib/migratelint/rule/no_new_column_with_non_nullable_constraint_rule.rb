module MigrateLint
  module Rule
    class NoNewColumnWithNonNullableRule < Base
      class << self
        def check(sql)
          statement_tree = get_statement_tree(sql)
          return unless statement_tree[PgQuery::ALTER_TABLE_STMT]

          cmds = statement_tree[PgQuery::ALTER_TABLE_STMT]["cmds"]
          cmds.each do |v|
            cmd = v[PgQuery::ALTER_TABLE_CMD]
            next unless cmd && cmd['subtype'] == PgQuery::AT_AddColumn

            constraints = cmd['def'][PgQuery::COLUMN_DEF]['constraints']
            next if constraints.nil?
            constraints.each do |constraint|
              if constraint[PgQuery::CONSTRAINT]['contype'] == PgQuery::CONSTR_TYPE_NOTNULL
                raise FailedRuleError.new(sql), "New columns with non-nullable constraints are unsafe."
              end
            end
          end
        end
      end
    end
  end
end
