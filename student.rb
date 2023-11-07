require './person'
class Student < Person
  attr_accessor :name
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  # day 3 project
  def classroom=(classroom)
    @classroom = classroom
    classroom.stuedents.push(self) unless classroom.stuedents.include?(self)
  end
end
