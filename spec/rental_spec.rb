require 'rspec'
require_relative '../Library/rental'
require_relative '../Library/person'

RSpec.describe Rental do
  let(:book_title) { 'English' }
  let(:book_author) { 'Sadaf Daneshgar' }
  let(:person_name) { 'Ali' }
  let(:person_age) { 25 }
  let(:person_class) { Person }

  let(:book) { instance_double('Book', title: book_title, author: book_author, rentals: []) }
  let(:person) do
    instance_double('Person', id: 1, name: person_name, age: person_age, class: person_class, rentals: [])
  end

  context 'when initialized' do
    it 'sets the date, book, and person' do
      rental_date = '2023-11-15'
      rental = Rental.new(rental_date, book, person)

      expect(rental.date).to eq(rental_date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'adds the rental to the book and person' do
      rental = Rental.new('2023-11-15', book, person)

      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end

  context 'when converted to JSON' do
    it 'returns the expected JSON format' do
      rental_date = '2023-11-15'
      rental = Rental.new(rental_date, book, person)

      expected_json = {
        date: rental_date,
        book: {
          title: book_title,
          author: book_author
        },
        person: {
          id: 1,
          name: person_name,
          age: person_age,
          class: 'Person'
        }
      }.to_json

      expect(rental.to_json).to eq(expected_json)
    end
  end
end
