class Test < ApplicationRecord
  def self.category_tests(category)
    Test.joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
