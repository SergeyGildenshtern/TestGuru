class BadgesController < ApplicationController
  def index
    @badges = current_user.badges
    @remaining_badges = Badge.remaining_badges(current_user)
  end
end
