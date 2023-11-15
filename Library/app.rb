require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require 'date'
require 'json'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def all_books(show_index: false)
    if @books.empty?
      puts 'There are no books in the library'
    else
      @books.each_with_index do |book, index|
        puts "#{show_index ? index.to_s : ' '} Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
    puts
  end

  def all_people(show_index: false)
    if @people.empty?
      puts 'There are no people in the library'
    else
      @people.each_with_index do |person, index|
        puts "#{show_index ? index.to_s : ' '} [#{person.class}] Name: #{person.name}, " \
             "ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts 'Book Created Successfully'
    puts ' '
  end

  def create_person(person)
    @people << person
    puts 'Person Created Successfully'
    puts ' '
  end

  def create_rental(rental)
    @rentals << rental
    puts 'Rental Created Successfully'
    puts ' '
  end

  def list_rentals(id)
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == id
    end
    puts ' '
  end

  def save_data
    save_books
    save_people
    save_rentals
  end

  def load_data
    load_books
    load_people
    load_rentals
  end

  private

  def save_books
    File.write('books.json', JSON.generate(@books))
  end

  def load_books
    return unless File.exist?('books.json')

    data = JSON.parse(File.read('books.json'))
    @books = data.map { |book_data| Book.new(book_data['title'], book_data['author']) }
  end

  def save_people
    File.write('people.json', JSON.generate(@people))
  end

  def load_people
    return unless File.exist?('people.json')

    data = JSON.parse(File.read('people.json'))

    @people = data.map do |person_data|
      puts "Loading person data: #{person_data.inspect}"

      if person_data['class'] == 'Student'
        Student.new(person_data['age'], person_data['parent_permission'], person_data['name'])
      elsif person_data['class'] == 'Teacher'
        Teacher.new(person_data['age'], person_data['specialization'], person_data['name'])
      end
    end
  end

  def save_rentals
    File.write('rentals.json', JSON.generate(@rentals))
  end

  def load_rentals
    return unless File.exist?('rentals.json')

    data = JSON.parse(File.read('rentals.json'))

    @rentals = data.map do |rental_data|
      puts "Loading rental data: #{rental_data.inspect}"

      book_data = rental_data['book']
      person_data = rental_data['person']

      book = @books.find { |b| b.title == book_data['title'] && b.author == book_data['author'] }
      person = @people.find { |p| p.id == person_data['id'] }

      if person
        rental = Rental.new(Date.parse(rental_data['date']), book, person)
        person.rentals ||= []
        person.rentals << rental
        rental
      else
        puts "Invalid rental data (person not found): #{rental_data.inspect}"
        nil # Ignore invalid data
      end
    end.compact # Remove nil entries
  end
end
