# rubocop:disable Metrics/CyclomaticComplexity
require './student'
require './teacher'
require './book'
require './rental'
require './modules/create'
require './modules/display'
require './modules/data'

class Main
  include Create
  include Display
  include ProcessData
  def initialize
    @books = load_books
    @persons = load_persons
    @rentals = load_rentals
  end

  def print_message
    puts '
      1 - List all books
      2 - List all people
      3 - Create a person
      4 - Create a book
      5 - Create a rental
      6 - List all rentals for a given person id
      7 - Exit
    '
    print INPUT_MSG.to_s
    option = gets.chomp.to_i
    handle_input(option)
    print_message
  end

  def handle_input(option)
    case option
    when 1
      list_books
    when 2
      list_persons
    when 3
      create_person_input
    when 4
      create_book_input
    when 5
      create_rental_input
    when 6
      list_rentals
    when 7
      puts 'Thank you for using this app'
      save_data
      exit
    else puts 'Please select a valid option'
         print_message
    end
  end

  def main
    puts ''
    puts 'Welcome to school library'
    puts 'Please choose a option by entring a number'
    print_message
  end
end

library = Main.new

library.main

# rubocop:enable Metrics/CyclomaticComplexity
