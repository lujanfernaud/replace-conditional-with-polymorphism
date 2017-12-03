class FamilyPhonePlan
  COST_PER_EXTRA_PHONE = 10

  def self.cost_for(number_of_phones, price)
    new(number_of_phones, price).cost
  end

  def initialize(number_of_phones, price)
    @number_of_phones = number_of_phones
    @price = price
  end

  def cost
    @price + extra_phones_cost
  end

  private

  def extra_phones_cost
    number_of_extra_phones * COST_PER_EXTRA_PHONE
  end

  def number_of_extra_phones
    @number_of_phones - 1
  end
end
