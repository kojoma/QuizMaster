require 'rails_helper'

describe Utils::IntegerToEn do
  describe 'to_en!' do
    it '0' do
      expect(Utils::IntegerToEn.to_en!(0)).to eq 'zero'
    end

    it '5' do
      expect(Utils::IntegerToEn.to_en!(5)).to eq 'five'
    end

    it '10' do
      expect(Utils::IntegerToEn.to_en!(10)).to eq 'ten'
    end

    it '55' do
      expect(Utils::IntegerToEn.to_en!(55)).to eq 'fifty-five'
    end

    it '100' do
      expect(Utils::IntegerToEn.to_en!(100)).to eq 'one hundred'
    end

    it '555' do
      expect(Utils::IntegerToEn.to_en!(555)).to eq 'five hundred and fifty-five'
    end

    it 'out of range' do
      expect(Utils::IntegerToEn.to_en!(1000)).to eq 1000
    end
  end
end
