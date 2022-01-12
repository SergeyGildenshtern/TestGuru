module ResultsHelper
  def test_progress(result)
    questions = result.test.questions
    "Question #{questions.count { |q| q.id <= result.current_question.id }} of #{questions.count}"
  end
end
