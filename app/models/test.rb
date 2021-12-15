class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def self.category_tests(category)
    Test.joins('INNER JOIN categories ON categories.id = tests.category_id')
          .where(categories: { title: category })
          .order(title: :desc)
          .pluck(:title)
  end
end
