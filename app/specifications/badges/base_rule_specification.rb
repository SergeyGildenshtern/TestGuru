module Badges
  class BaseRuleSpecification < AbstractRuleSpecification

    protected

    def unique_successful_results
      user = @result.user

      if user.badges.include?(@badge)
        last_badge_date = user.badges_users.where(badge_id: @badge.id).last.created_at
        user.results.select { |r| r.successfully && r.created_at > last_badge_date }.uniq(&:test)
      else
        user.results.select(&:successfully).uniq(&:test)
      end
    end
  end
end
