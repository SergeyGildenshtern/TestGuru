class QuestionsController < ApplicationController

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
    question = Question.new(text: params[:text], test: Test.find(params[:test_id]))
    question.save
    redirect_to test_questions_path
  end

  def delete
    Question.destroy(@question)
  end

  private

  def find_question
    @question = Question.find_by!(id: params[:id], test: params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found!'
  end
end
