class ResultsController < ApplicationController
  before_action :find_result, only: %i[show update score]

  def show
  end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      TestsMailer.completed_test(@result).deliver_now
      assigning_badges

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

  def assigning_badges
    result = BadgeService.new(@result).call

    if result.any_badges?
      result.badges.each { |badge| current_user.badges_users.create(badge_id: badge.id) }
      flash[:notice] = I18n.t('.admin.badges.new')
    end
  end
end
