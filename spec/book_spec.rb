require_relative '../book'
require_relative '../person'
require 'rspec'

describe Book do
  describe '#initialize' do
    it 'creates a new book' do
      book = Book.new('English', 'Sadaf Daneshgar')
      expect(book).to be_a(Book)
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      book = Book.new('English', 'Sadaf Daneshgar')
      expect(book.title).to eq('English')
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      book = Book.new('English', 'Sadaf Daneshgar')
      expect(book.author).to eq('Sadaf Daneshgar')
    end
  end

  describe '#rentals' do
    it 'returns the correct rentals' do
      book = Book.new('English', 'Sadaf Daneshgar')
      expect(book.rentals).to eq([])
    end
  end

  describe '#add_rental' do
    it 'adds a new rental' do
      book = Book.new('English', 'Sadaf Daneshgar')
      book.add_rental('2019-04-01', Person.new('Ali', 17))
      expect(book.rentals.length).to eq(1)
    end
  end

  describe '#to_json' do
    it 'returns the correct json' do
      book = Book.new('English', 'Sadaf Daneshgar')
      expect(book.to_json).to eq('{"title":"English","author":"Sadaf Daneshgar"}')
    end
  end
end
