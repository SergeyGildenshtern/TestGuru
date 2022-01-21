class ResultsController < ApplicationController
  before_action :find_result, only: %i[show update score gist]

  def show
  end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      TestsMailer.completed_test(@result).deliver_now
      redirect_to score_result_path(@result)
    else
      render :show
    end
  end

  def score
  end

  def gist
    result = GistQuestionService.new(@result.current_question).call

    if result.html_url
      @result.current_question.gists.create(url: result.html_url, user: current_user)
      flash_options = { notice: t('.success', gist_url: result.html_url ) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @result, flash_options
  end

  private

  def find_result
    @result = Result.find(params[:id])
  end
end
