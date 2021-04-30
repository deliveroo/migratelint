require "pg_query"

require "migratelint/version"

require "migratelint/rule/error"
require "migratelint/rule/rule"

require "migratelint/rule/concurrent_index_rule"
require "migratelint/rule/no_existing_column_alter_rule"
require "migratelint/rule/no_new_column_with_unique_constraint_rule"
require "migratelint/rule/vacuum_full_rule"

require "migratelint/rule/checks"
