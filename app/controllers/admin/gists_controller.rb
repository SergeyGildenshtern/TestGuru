class Admin::GistsController < Admin::BaseController
  skip_before_action :admin_required!, only: :create

  def index
    @gists = Gist.all
  end

  def create
    @result = current_user.results.last
    response = GistQuestionService.new(@result.current_question).call

    if response.success?
      @result.current_question.gists.create(url: response.url, user: current_user)
      flash[:notice] = t('.success', gist_link: helpers.link_to(response.url, response.url, target: '_blank'))
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @result
  end
end
