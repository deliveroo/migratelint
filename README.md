# Migratelint

Encoding rules from [Braintree’s “Safe Operations for High Volume
PostgreSQL][braintree-1] and [“PostgreSQL at Scale: Database Schema
Changes Without Downtime”][braintree-2] as Postgres migration linter
rules using [pg_query][pg_query].

## Example

```shell
❯ docker run -v $(pwd)/testdata:/testdata jeffreylo/migratelint:0.1.0 check /testdata/*.sql
/testdata/add_column_with_default_constraint.sql => New columns with defaults are unsafe.
/testdata/add_column_with_not_null_constraint.sql => New columns with non-nullable constraints are unsafe.
/testdata/add_column_with_unique_constraint.sql => New columns with unique constraints are unsafe.
/testdata/add_multiple_columns_with_violation.sql => Type changes on existing columns are unsafe.
/testdata/alter_existing_column_type.sql => Type changes on existing columns are unsafe.
/testdata/create_index_without_concurrently.sql => Indexes must be created with CONCURRENTLY.
```

[braintree-1]: https://www.braintreepayments.com/blog/safe-operations-for-high-volume-postgresql/
[braintree-2]: https://medium.com/braintree-product-technology/postgresql-at-scale-database-schema-changes-without-downtime-20d3749ed680
[pg_query]: https://github.com/lfittl/pg_query
