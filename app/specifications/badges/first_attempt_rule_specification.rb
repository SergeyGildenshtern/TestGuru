module Badges
  class FirstAttemptRuleSpecification < BaseRuleSpecification
    def satisfies?
      perfect_result && count_attempts == 1
    end

    private

    def perfect_result
      @result.score == @result.test.questions.count
    end

    def count_attempts
      @result.user.results.count { |r| r.test == @result.test }
    end
  end
end
