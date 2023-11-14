require_relative 'nameable'
# for second day project
require_relative 'rental'
# for third day project

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  # day 2 project
  def correct_name
    @name
  end

  # day 3 project
  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def to_json(*_args)
    {
      id: @id,
      name: @name,
      age: @age,
      class: self.class.to_s
    }.to_json
  end
end
