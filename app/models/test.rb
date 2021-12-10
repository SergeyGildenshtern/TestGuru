class Test < ApplicationRecord
  def self.category_tests(category)
    Test.joins('LEFT JOIN categories ON categories.id = tests.category_id AND categories.title = ?',
               category).order(title: :desc).pluck(:title)
  end
end
