class IndividualPhonePlan
  def self.cost_for(number_of_phones, price)
    new(number_of_phones, price).cost
  end

  def initialize(number_of_phones, price)
    @number_of_phones = number_of_phones
    @price = price
  end

  def cost
    @number_of_phones * @price
  end
end
