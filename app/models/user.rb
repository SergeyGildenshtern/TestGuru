class User < ApplicationRecord
  def user_tests(level)
    Result.where(user_id: id).and(Result.joins(:test).where(tests: { level: level }))
  end
end
