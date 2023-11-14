require 'rspec'
require_relative '../trimmer_decorator'

class TestNameable < Nameable
  def correct_name
    'Ali'
  end
end

describe Decorator do
  let(:nameable_instance) { TestNameable.new }
  let(:decorator_instance) { Decorator.new(nameable_instance) }

  it 'raises NotImplementedError for correct_name when called on the base class' do
    expect do
      Nameable.new.correct_name
    end.to raise_error(NotImplementedError, 'Subclasses must implement the correct_name method.')
  end

  it 'returns the correct name using the decorator' do
    expect(decorator_instance.correct_name).to eq('Ali')
  end

  it 'updates the nameable attribute' do
    new_nameable_instance = TestNameable.new
    decorator_instance.nameable = new_nameable_instance
    expect(decorator_instance.correct_name).to eq('Ali')
    expect(new_nameable_instance.correct_name).to eq('Ali')
  end
end
