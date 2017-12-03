class BusinessPhonePlan
  def self.cost_for(number_of_phones, price)
    new(number_of_phones, price).cost
  end

  def initialize(number_of_phones, price)
    @number_of_phones = number_of_phones
    @price = price
  end

  def cost
    subtotal = @number_of_phones * @price

    if @number_of_phones < 50
      subtotal * 0.75
    else
      subtotal * 0.50
    end
  end
end
