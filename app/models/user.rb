class User < ApplicationRecord
  def user_tests(level)
    Result.where(user: id).and(Result.joins(:test).where(tests: { level: level }))
  end
end
