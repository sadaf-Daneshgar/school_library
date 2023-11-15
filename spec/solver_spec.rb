require 'rspec'
require_relative '../TDD/solver'

RSpec.describe Solver do
  # test for factorial method
  describe '#factorial' do
    it 'returns 1 when given 0' do
      expect(subject.factorial(0)).to eq(1)
    end

    it 'returns 120 when given 5' do
      expect(subject.factorial(5)).to eq(120)
    end

    it 'raises an exception when given a negative number' do
      expect { subject.factorial(-1) }.to raise_error(RuntimeError)
    end
  end

  # test for reverse method
  describe '#reverse' do
    it 'returns olleh when given hello' do
      expect(subject.reverse('hello')).to eq('olleh')
    end
  end
  describe '#fizzbuzz' do
    it 'returns fizzbuzz when given 15' do
      expect(subject.fizzbuzz(15)).to eq('fizzbuzz')
    end

    it 'returns fizz when given 3' do
      expect(subject.fizzbuzz(3)).to eq('fizz')
    end

    it 'returns buzz when given 5' do
      expect(subject.fizzbuzz(5)).to eq('buzz')
    end

    it 'returns 2 when given 2' do
      expect(subject.fizzbuzz(2)).to eq('2')
    end
  end
end
