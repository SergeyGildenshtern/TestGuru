class BadgeService
  Result = Struct.new(:badges, :any_badges?)

  def initialize(result)
    @result = result
    @user = @result.user
    @test = @result.test
  end

  def call
    badges = Badge.all.select { |b| send("#{b.badge_type}?".to_s, b) }

    Result.new badges, badges.present?
  end

  private

  def first_attempt?(badge)
    @result.score == @test.questions.count && @user.results.count { |r| r.test == @test } == 1
  end

  def all_category?(badge)
    unique_successful_results(badge)
      .count { |r| r.test.category.title == badge.addition } == @test.category.tests.count
  end

  def all_level?(badge)
    unique_successful_results(badge)
      .count { |r| r.test.level == badge.addition.to_i } == Test.where(level: @test.level).count
  end

  def unique_successful_results(badge)
    if @user.badges.include?(badge)
      last_badge_date = @user.badges_users.where(badge_id: badge.id).last.created_at
      @user.results.select { |r| r.successfully? && r.created_at > last_badge_date }.uniq(&:test)
    else
      @user.results.select(&:successfully?).uniq(&:test)
    end
  end
end
