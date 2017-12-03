require 'spec_helper'

describe BusinessPhonePlan do
  describe '.cost_for' do
    it 'returns the price with a 25% percent discount' do
      number_of_phones = 3
      price = 40

      expect(described_class.cost_for(number_of_phones, price)).to eq(90)
    end

    it 'returns the price with a 50% percent discount' do
      number_of_phones = 60
      price = 40

      expect(described_class.cost_for(number_of_phones, price)).to eq(1200)
    end
  end
end
