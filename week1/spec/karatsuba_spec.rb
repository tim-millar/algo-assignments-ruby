require 'spec_helper'
require 'karatsuba'

describe Karatsuba do
  describe '.multiply' do
    it 'computes the product of 2 and 3' do
      expect(Karatsuba.multiply(2, 3)).to eql(6)
    end

    it 'computes the product of two 3-digit numbers' do
      expect(Karatsuba.multiply(123, 456)).to eql(56088)
    end

    it 'computes the product of two 4-digit numbers' do
      expect(Karatsuba.multiply(1234, 5678)).to eql(7006652)
    end

    it 'computes the product of two 6-digit number' do
      expect(Karatsuba.multiply(123456, 456789)).to eql(56393342784)
    end

    it 'computes the product of a 5 and a 4-digit number' do
      expect(Karatsuba.multiply(12345, 6789)).to eql(83810205)
    end

    it 'computes the product of a 9 and 10-digit number' do
      expect(Karatsuba.multiply(1234567890,123456789)).
        to eql(152415787501905210)
    end

    it 'computes the product of two big numbers' do
      expect(Karatsuba.multiply(1234567890, 123456789)).
        to eql(152415787501905210)
    end

    it 'computes the product of two huge numbers' do
      expect(Karatsuba.multiply(1234567891234567890, 123456789123456789)).
        to eql(152415787806736785156226207501905210)
    end
  end
end
