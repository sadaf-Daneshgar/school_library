require 'rspec'
require_relative '../person'

describe Person do
  let(:person) { Person.new(20, 'Ali') }

  it 'has an age' do
    expect(person.age).to eq(20)
  end

  it 'has a name' do
    expect(person.name).to eq('Ali')
  end

  it 'has an ID' do
    expect(person.id).to be_a(Integer)
  end

  it 'has parent permission by default' do
    expect(person.can_use_services?).to be true
  end

  it 'can check if of age' do
    expect(person.send(:of_age?)).to be true
  end

  it 'can use services if of age' do
    person.age = 18
    expect(person.can_use_services?).to be true
  end

  it 'can use services with parent permission' do
    person.age = 16
    expect(person.can_use_services?).to be true
  end

  it 'cannot use services without parent permission or being of age' do
    person.age = 16
    person.instance_variable_set(:@parent_permission, false)
    expect(person.can_use_services?).to be false
  end

  it 'returns correct name' do
    expect(person.correct_name).to eq('Ali')
  end

  it 'adds rental' do
    book = double('book')
    expect(Rental).to receive(:new).with(any_args).and_return(double('rental'))
    person.add_rental('2023-01-01', book)
  end

  it 'converts to JSON' do
    json_result = {
      id: person.id,
      name: person.name,
      age: person.age,
      class: 'Person'
    }.to_json

    expect(person.to_json).to eq(json_result)
  end
end
