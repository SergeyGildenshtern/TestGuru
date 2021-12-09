class User < ApplicationRecord
  def user_tests(level)
    Test.where(id: Result.where(user: id).pluck(:test_id), level: level)
  end
end
