require 'rspec'
require_relative '../Library/student'

describe Student do
  let(:classroom) { double('Classroom', students: []) }
  let(:student) { Student.new(18, classroom, 'Ali') }

  it 'has an age' do
    expect(student.age).to eq(18)
  end

  it 'has a name' do
    expect(student.name).to eq('Ali')
  end

  it 'has a classroom' do
    expect(student.classroom).to eq(classroom)
  end

  it 'can play hooky' do
    expect(student.play_hooky).to eq('¯(ツ)/¯')
  end

  it 'can set a classroom' do
    new_classroom = double('New Classroom', students: [])
    student.classroom = new_classroom

    expect(student.classroom).to eq(new_classroom)
    expect(new_classroom.students).to include(student)
  end

  it 'does not add the student to the classroom if already included' do
    student.classroom = classroom

    expect(classroom.students).to include(student)
    expect(classroom.students.size).to eq(1)

    student.classroom = classroom

    expect(classroom.students.size).to eq(1)
  end
end
