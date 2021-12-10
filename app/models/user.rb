class User < ApplicationRecord
  def user_tests(level)
    Test.joins('INNER JOIN results ON tests.id = results.test_id AND results.user_id = ?', id).where(level: level)
  end
end
