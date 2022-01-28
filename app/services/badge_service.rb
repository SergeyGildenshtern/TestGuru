class BadgeService
  Result = Struct.new(:badges, :any_badges?)

  def initialize(result)
    @result = result
    @user = @result.user
    @test = @result.test
  end

  def call
    badges = Badge.where('addition = ? OR addition = ? OR badge_type = "first_attempt"', @test.category.title, @test.level)
                  .select { |b| send("#{b.badge_type}?".to_s) }

    Result.new badges, badges.present?
  end

  private

  def first_attempt?
    @result.score == @test.questions.count && @user.results.count { |r| r.test == @test } == 1
  end

  def all_category?
    category = @test.category
    unique_successful_results.count { |r| r.test.category == category } == category.tests.count
  end

  def all_level?
    level = @test.level
    unique_successful_results.count { |r| r.test.level == level } == Test.where(level: level).count
  end

  def unique_successful_results
    @user.results.select(&:successfully?).uniq(&:test)
  end
end
