require 'rspec'
require_relative '../Library/teacher'

describe Teacher do
  let(:teacher) { Teacher.new(35, 'Ahmad', 'Ali') }

  it 'has an age' do
    expect(teacher.age).to eq(35)
  end

  it 'has a name' do
    expect(teacher.name).to eq('Ali')
  end

  it 'has a specialization' do
    expect(teacher.specialization).to eq('Ahmad')
  end

  it 'can use services' do
    expect(teacher.can_use_services?).to eq(true)
  end

  it 'can have a different name' do
    teacher.name = 'Ali'

    expect(teacher.name).to eq('Ali')
  end

  it 'can have a different specialization' do
    teacher.specialization = 'Science'

    expect(teacher.specialization).to eq('Science')
  end

  it 'can have a different age' do
    teacher.age = 40

    expect(teacher.age).to eq(40)
  end

  it 'cannot change parent permission' do
    expect { teacher.parent_permission = false }.to raise_error(NoMethodError)
  end
end
