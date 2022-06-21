require_relative './app'

$app = App.new

def main
  puts ''
  puts 'Welcome to school libray app!'
  puts 'Please choose an option by entering a number:'
  options
end

def options
  puts '
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - list all rentals for a given person id
    7 - Exit
    '
  print 'Select an Option: '
  user_input = gets.chomp
  $app.get_option user_input
end

main
