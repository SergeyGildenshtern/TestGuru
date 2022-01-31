module Badges
  class AllLevelRuleSpecification < BaseRuleSpecification

    def satisfies?
      return false if @result.test.level != @badge.addition.to_i

      unique_successful_results.count { |r| r.test.level == @badge.addition.to_i } == count_tests_by_level
    end

    private

    def count_tests_by_level
      Test.where(level: @result.test.level).count
    end
  end
end
