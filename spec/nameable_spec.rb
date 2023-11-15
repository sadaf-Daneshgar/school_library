require 'rspec'
require_relative '../nameable'

class TestNameable < Nameable
  def correct_name
    'Ali'
  end
end

describe Nameable do
  let(:nameable_instance) { TestNameable.new }

  it 'raises NotImplementedError for correct_name when called on the base class' do
    expect do
      Nameable.new.correct_name
    end.to raise_error(NotImplementedError, 'Subclasses must implement the correct_name method.')
  end

  it 'returns the correct name when correct_name is implemented in a subclass' do
    expect(nameable_instance.correct_name).to eq('Ali')
  end
end
