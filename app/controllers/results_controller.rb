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

    if result.success?
      @result.current_question.gists.create(url: result.url, user: current_user)
      flash[:notice] = t('.success', gist_link: helpers.link_to(result.url, result.url, target: '_blank'))
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @result
  end

  private

  def find_result
    @result = Result.find(params[:id])
  end
end
