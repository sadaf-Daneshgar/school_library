require_relative 'app'
require_relative 'refactor'

def main

  # create a new instance of School_Library
  school_library = SchoolLibrary.new()
  # call the run method
  school_library.choices
end

# call the main method and this starts the execution of the program
main
