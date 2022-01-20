class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password

  def user_tests(level)
    tests.where(level: level)
  end

  def start_test(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
