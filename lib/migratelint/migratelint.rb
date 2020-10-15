require 'migratelint/rule/checks'

module MigrateLint
  def self.check(sql)
    MigrateLint::Rule::CHECKS.each do |rule|
      rule.check(sql)
    end
  end
end
