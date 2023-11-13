# main.rb
require_relative 'app'
require_relative 'refactor'

def main
  app = App.new
  refactor = Refactor.new(app)

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
    when 1 then app.all_books
    when 2 then app.all_people
    when 3 then refactor.create_person
    when 4 then refactor.create_book
    when 5 then refactor.create_rental
    when 6 then refactor.list_rentals
    when 7 then break
    else
      puts 'Invalid option. Try again'
    end
  end
end

# call the main method and this starts the execution of the program
main
