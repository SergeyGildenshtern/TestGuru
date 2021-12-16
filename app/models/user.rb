class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  def user_tests(level)
    Test.joins(:results).where(results: { user_id: id }, tests: { level: level })
  end
end
