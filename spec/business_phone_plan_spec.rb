require 'spec_helper'

describe BusinessPhonePlan do
  describe '.cost_for' do
    it 'returns cost for plan' do
      number_of_phones = 3
      price = 40

      expect(described_class.cost_for(number_of_phones, price)).to eq(90)
    end
  end
end
