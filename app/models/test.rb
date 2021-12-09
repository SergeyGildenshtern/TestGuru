class Test < ApplicationRecord
  def self.category_tests(category)
    Test.where(category: Category.where(title: category).pluck(:id)).order(title: :desc).pluck(:title)
  end
end
