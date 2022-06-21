require_relative './book'
require_relative './classroom'
require_relative './person'
require_relative './rental'
require_relative './teacher'
require_relative './student'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @classroom_default = Classroom.new('default-classroom')
  end

  # rubocop:disable Metrics

  def get_option(user_input)
    case user_input
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_a_person
    when '4'
      create_a_book
    when '5'
      create_a_rental
    when '6'
      list_rentals_by_person_id
    when '7'
      puts 'Thank you for using our library'
    else
      puts 'Please enter a number between 1 and 7'
      options
    end
  end

  # rubocop:enable Metrics

  def list_all_books
    puts 'There are no books registered! Please add books.' if @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    options
  end

  def list_all_people
    puts 'The are no people registered! Please add a student or teacher.' if @people.empty?
    @people.map { |person| puts "[#{person.class}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age}, " }
    options
  end

  def create_a_person
    print 'Do you want to create a student (1) or teacher (2) [Input a number]: '
    option = gets.chomp

    case option
    when '1'
      create_a_student
    when '2'
      create_a_teacher
    else
      while option != '1' || option != '2'
        print 'Invalid input. Please type 1 or 2 [Input a number]:'
        option = gets.chomp
        create_a_student if option == '1'
        create_a_teacher if option == '2'
      end
    end
  end

  def create_a_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase

    student = Student.new(age, @class, name, parent_permission)
    @people << student

    puts 'Student created successfully'
    options
  end

  def create_a_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    @people << teacher

    puts 'Teacher created successfully'
    options
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book added successfully'
    options
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index} Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_id], @people[person_id])
    @rentals << rental

    puts 'Rental created successfully'
    options
  end

  def list_rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
    options
  end
end
