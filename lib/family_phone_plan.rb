class FamilyPhonePlan
  def self.cost_for(number_of_phones, price)
    new(number_of_phones, price).cost
  end

  def initialize(number_of_phones, price)
    @number_of_phones = number_of_phones
    @price = price
  end

  def cost
    number_of_extra_phones = @number_of_phones - 1
    cost_per_extra_phone = 10

    @price + (number_of_extra_phones * cost_per_extra_phone)
  end
end
