class User < ApplicationRecord
  has_many :tests, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy

  def user_tests(level)
    Test.joins(:results).where(results: { user_id: id }, tests: { level: level })
  end
end
