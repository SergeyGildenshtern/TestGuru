module TestsHelper
  TEST_LEVELS = { (0..1) => :easy, (2..4) => :medium, (5..Float::INFINITY) => :hard }.freeze

  def test_level(test)
    TEST_LEVELS.find { |k, v| break v if k.cover? test.level }
  end

  def test_time(test)
    if test.time.present?
      test.time
    else
      I18n.t('tests.no_time')
    end
  end
end
