class User < ApplicationRecord
  def user_tests(level)
    Test.where(level: level)
  end
end
