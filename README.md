# Upcase Refactoring Trail

## Replace Conditional with Polymorphism

Refactoring exercise replacing conditional with polymorphism for the [Upcase Refactoring Trail](https://thoughtbot.com/upcase/refactoring).

### Before

```ruby
# phone_plan.rb

class PhonePlan
  def initialize(number_of_phones:, price:, type:)
    @number_of_phones = number_of_phones
    @price = price
    @type = type
  end

  def cost
    if type == "individual"
      number_of_phones * price
    elsif type == "family"
      number_of_extra_phones = number_of_phones - 1
      cost_per_extra_phone = 10

      price + (number_of_extra_phones * cost_per_extra_phone)
    elsif type == "business"
      subtotal = number_of_phones * price

      if number_of_phones < 50
        subtotal * 0.75
      else
        subtotal * 0.50
      end
    end
  end

  private

  attr_reader :number_of_phones, :price, :type
end
```

### After

```ruby
# phone_plan.rb

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
```

### Highlights

- Extract `IndividualPhonePlan`
- Extract `FamilyPhonePlan`
- Extract `BusinessPhonePlan`
- Get the phone plan dynamically using `Object.const_get` and remove `if else` statements in `PhonePlan#cost`
