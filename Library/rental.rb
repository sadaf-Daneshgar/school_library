class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end

  def to_json(*_args)
    {
      date: @date,
      book: {
        title: @book.title,
        author: @book.author
      },
      person: {
        id: @person.id,
        name: @person.name,
        age: @person.age,
        class: @person.class.to_s
      }
    }.to_json
  end
end
