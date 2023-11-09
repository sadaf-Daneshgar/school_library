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

  # method to show list of all books
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

  # method to show list of all person
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

  # method to create a new book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book Created Successfully'
    puts ' '
  end

  # method to create person
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid Option'
    end
  end

  # method to create student
  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has Parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    student = Student.new(age, parent_permission, name)
    @people << student
    puts 'Person Created Successfully'
    puts ' '
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts 'Person Created Successfully'
    puts ' '
  end

  # method to create a new rental
  def create_rental
    puts 'Select a book from the following list by number'
    all_books(show_index: true)
    book_index = gets.chomp.to_i - 1
    puts 'Select a person from the following list by number (not id)'
    all_people(show_index: true)
    person_index = gets.chomp.to_i - 1
    print 'Date: '
    date = Date.parse(gets.chomp)
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental
    puts 'Rental Created Successfully'
    puts ' '
  end

  # method List all rentals for a given person id
  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == id
      puts ' '
    end
  end
end
