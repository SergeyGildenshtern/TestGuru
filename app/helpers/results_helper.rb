module ResultsHelper
  def test_progress(result)
    "Question #{result.current_question_number} of #{result.test.questions.count}"
  end
end
