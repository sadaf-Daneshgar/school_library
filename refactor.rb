class SchoolLibrary
  def initialize
    @app = App.new
  end

  def choices
    puts 'Welcome to School Library App!'
    puts ' '
    
    loop do
      puts 'Please select an option by entering a number:'
      puts '1. List all books'
      puts '2. List all people'
      puts '3. Create a person'
      puts '4. Create a book'
      puts '5. Create a rental'
      puts '6. List all rentals for a given person id '
      puts '7. Exit'
      
      option = gets.chomp.to_i

      case option
      when 1 then @app.all_books
      when 2 then @app.all_people
      when 3 then create_person
      when 4 then create_book
      when 5 then create_rental
      when 6 then list_rentals
      when 7 then break
      else
        puts 'Invalid option. Try again'
      end
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @app.create_book(title, author)
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    case person_type
    when 1 then create_student
    when 2 then create_teacher
    else
      puts 'Invalid Option'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? (Y/N): '
    parent_permission = gets.chomp.downcase == 'y'
    person = Student.new(age, parent_permission, name)
    @app.create_person(person)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @app.create_person(teacher)
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @app.all_books(show_index: true)
    book_index = gets.chomp.to_i - 1
    puts 'Select a person from the following list by number (not id)'
    @app.all_people(show_index: true)
    person_index = gets.chomp.to_i - 1
    print 'Date: '
    date = Date.parse(gets.chomp)
    rental = Rental.new(date, @app.instance_variable_get(:@books)[book_index], @app.instance_variable_get(:@people)[person_index])
    @app.create_rental(rental)
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    @app.list_rentals(id)
  end
end
