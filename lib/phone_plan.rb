class PhonePlan
  def initialize(number_of_phones:, price:, type:)
    @number_of_phones = number_of_phones
    @price = price
    @type = type
  end

  def cost
    plan.cost_for(@number_of_phones, @price)
  end

  private

  def plan
    Object.const_get(@type.capitalize + "PhonePlan")
  end
end
