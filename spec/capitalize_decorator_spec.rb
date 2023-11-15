require 'rspec'
require_relative '../capitalize_decorator'

class TestNameable < Nameable
  def correct_name
    'Ali'
  end
end

describe CapitalizeDecorator do
  let(:nameable_instance) { TestNameable.new }
  let(:decorator_instance) { CapitalizeDecorator.new(nameable_instance) }

  it 'capitalizes the correct name using the decorator' do
    expect(decorator_instance.correct_name).to eq('Ali')
  end

  it 'updates the nameable attribute' do
    new_nameable_instance = TestNameable.new
    decorator_instance.nameable = new_nameable_instance
    expect(decorator_instance.correct_name).to eq('Ali')
    expect(new_nameable_instance.correct_name).to eq('Ali')
  end
end
