class AbstractRuleSpecification

  def initialize(badge, result)
    @badge = badge
    @result = result
  end

  def satisfies?
    raise "#{__method__} undefined for #{self.class}"
  end
end
