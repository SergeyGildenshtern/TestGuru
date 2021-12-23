class QuestionsController < ApplicationController

  before_action :find_test, only: %i[create]
  before_action :find_question, only: %i[show delete]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    questions = Question.where(test: params[:test_id])
    render plain: questions.inspect
  end

  def show
    render plain: @question.text
  end

  def new
  end

  def create
    @question = @test.questions.build(question_params)
    @question.save

    if @question.errors.empty?
      redirect_to @question
    else
      redirect_to new_test_question_path
    end
  end

  def delete
    @question.destroy
    redirect_to test_questions_path
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:text)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found!'
  end
end
