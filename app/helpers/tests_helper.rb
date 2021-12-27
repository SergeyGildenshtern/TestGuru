module TestsHelper
  TEST_LEVELS = { (0..1) => :easy, (2..4) => :medium, (5..Float::INFINITY) => :hard }.freeze

  def test_level(test)
    TEST_LEVELS.find { |k, v| break v if k.cover? test.level }
  end
end
