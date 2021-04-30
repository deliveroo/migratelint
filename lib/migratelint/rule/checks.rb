module MigrateLint
  module Rule
    CHECKS = [
      ConcurrentIndexRule,
      NoExistingColumnAlterRule,
      NoNewColumnWithUniqueConstraintRule,
      NoVacuumFullRule
    ]
  end
end
