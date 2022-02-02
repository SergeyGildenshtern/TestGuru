class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_next_question

  PERCENTAGE_PASSING_TEST = 85

  def completed?
    current_question.nil? || (remaining_time <= 0 if test.time.present?)
  end

  def accept!(answer_ids)
    self.score += 1 if correct_answer?(answer_ids)
    update_success
    save!
  end

  def percentage_correct_answers
    (self.score * 100 / self.test.questions.count.to_f).round(1)
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def update_success
    self.successfully = percentage_correct_answers >= PERCENTAGE_PASSING_TEST
  end

  def remaining_time
    (created_at.to_i + test.time * 60) - Time.current.to_i
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end
end
