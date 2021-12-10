class User < ApplicationRecord
  def user_tests(level)
    Test.joins('INNER JOIN results ON tests.id = results.test_id').where(results: { user_id: id }, tests: { level: level })
  end
end
