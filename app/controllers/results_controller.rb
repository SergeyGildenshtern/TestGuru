class ResultsController < ApplicationController
  before_action :find_result, only: %i[show update score]

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

  private

  def find_result
    @result = Result.find(params[:id])
  end
end
