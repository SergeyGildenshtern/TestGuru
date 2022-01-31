class BadgeService

  RULES = {
    first_attempt: Badges::FirstAttemptRuleSpecification,
    all_category: Badges::AllCategoryRuleSpecification,
    all_level: Badges::AllLevelRuleSpecification
  }.freeze

  def initialize(result)
    @result = result
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.badge_type.to_sym].new(badge, @result)
      add_badge(badge) if rule.satisfies?
    end
  end

  private

  def add_badge(badge)
    @result.user.badges_users.create(badge_id: badge.id)
  end
end
