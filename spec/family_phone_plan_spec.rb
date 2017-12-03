require 'spec_helper'

describe FamilyPhonePlan do
  describe '.cost_for' do
    it 'discounts each additional phone' do
      number_of_phones = 3
      price = 40

      expect(described_class.cost_for(number_of_phones, price)).to eq(60)
    end
  end
end
