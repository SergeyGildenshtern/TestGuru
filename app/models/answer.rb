class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validate :validate_count_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_count_answers
    if question.answers.size > 4
      errors.add(:base, :count_answers, message: 'count of answers to the question should be from 1 to 4')
    end
  end
end
