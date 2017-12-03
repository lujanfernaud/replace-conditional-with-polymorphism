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

- Extract `IndividualPhonePlan` ([see commit](https://github.com/lujanfernaud/replace-conditional-with-polymorphism/commit/c3776715e4853cbff7ed7dd3c6ec28062b73258b))
- Extract `FamilyPhonePlan` ([see commit](https://github.com/lujanfernaud/replace-conditional-with-polymorphism/commit/bb358dded003cf4b15c8c0e3221073c466e6b507))
- Extract `BusinessPhonePlan` ([see commit](https://github.com/lujanfernaud/replace-conditional-with-polymorphism/commit/bbedf15707b56ec5ac6d79aba5f1f610acc49f95))
- Get the phone plan dynamically and remove `if else` statements in `PhonePlan#cost` ([see commit](https://github.com/lujanfernaud/replace-conditional-with-polymorphism/commit/d2d42daaccea86da4855159535ab262e13e7c79e))
