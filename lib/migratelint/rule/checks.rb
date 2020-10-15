module MigrateLint
  module Rule
    CHECKS = [
      ConcurrentIndexRule,
      NoExistingColumnAlterRule,
      NoNewColumnWithNonNullableRule,
      NoNewColumnWithDefaultRule,
      NoNewColumnWithUniqueConstraintRule,
      NoVacuumFullRule
    ]
  end
end
