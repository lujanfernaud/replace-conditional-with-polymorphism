class PhonePlan
  def initialize(number_of_phones:, price:, type:)
    @number_of_phones = number_of_phones
    @price = price
    @type = type
  end

  def cost
    if type == "individual"
      IndividualPhonePlan.cost_for(number_of_phones, price)
    elsif type == "family"
      FamilyPhonePlan.cost_for(number_of_phones, price)
    elsif type == "business"
      BusinessPhonePlan.cost_for(number_of_phones, price)
    end
  end

  private

  attr_reader :number_of_phones, :price, :type
end
