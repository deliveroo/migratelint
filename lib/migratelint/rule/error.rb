module MigrateLint
  module Rule
    class Error < StandardError; end
    class FailedRuleError < Error
      attr_reader :sql
      def initialize(sql)
        @sql = sql
      end
    end
  end
end
