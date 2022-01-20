class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])

    current_user.tests.push(@test)
    redirect_to current_user.start_test(@test)
  end
end
