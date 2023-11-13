# app.rb
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require 'date'

class App
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
        puts "#{show_index ? index : ' '} Title: \"#{book.title}\", Author:  #{book.author}"
      end
    end
    puts
  end

  def all_people(show_index: false)
    if @people.empty?
      puts 'There are no people in the library'
    else
      @people.each_with_index do |person, index|
        puts "#{show_index ? index : ' '} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
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
end
