require_relative '../Library/classroom'
require_relative '../Library/student'

RSpec.describe Classroom do
  describe '#initialize' do
    it 'creates a new classroom with a label' do
      classroom = Classroom.new('Math Room')
      expect(classroom.label).to eq('Math Room')
    end

    it 'initializes with an empty list of students' do
      classroom = Classroom.new('English Room')
      expect(classroom.students).to be_empty
    end
  end

  describe '#label' do
    it 'can change the label of the classroom' do
      classroom = Classroom.new('Physics Room')
      classroom.label = 'Chemistry Room'
      expect(classroom.label).to eq('Chemistry Room')
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom = Classroom.new('History Room')
      student = instance_double('Student', name: 'John', classroom: nil)
      allow(student).to receive(:classroom=)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
