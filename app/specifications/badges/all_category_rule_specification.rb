module Badges
  class AllCategoryRuleSpecification < BaseRuleSpecification

    def satisfies?
      return false if @result.test.category.title != @badge.addition

      unique_successful_results.count { |r| r.test.category.title == @badge.addition } == count_tests_by_category
    end

    private

    def count_tests_by_category
      @result.test.category.tests.count
    end
  end
end
