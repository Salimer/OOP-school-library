require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'

class App
  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_a_person(choice, name, age)
    if choice == '1'
      person = create_a_student(name, age)
      person.type = 'Student'
    elsif choice == '2'
      person = create_a_teacher(name, age)
      person.type = 'Teacher'
    else
      puts 'wrong choice, die'
    end
    @people << person
    puts 'Person created successfully'
  end

  def create_a_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_a_rental()
    puts '
Select a book from the following list by number'
    list_books
    index_book = gets.chomp.to_i
    puts '
Select a person from the following list by number (not id)'
    list_people
    index_person = gets.chomp.to_i
    print '
Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[index_book], @people[index_person])
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_all_rentals_for_a_given_person_id
    puts 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end

  private

  def create_a_student(name, age)
    print 'Has parent permission? [Y/N]: '
    parent = gets.chomp
    permission = true if %w[Y y].include?(parent)
    permission = false if %w[N n].include?(parent)
    label = 'math'
    classroom = Classroom.new(label)
    Student.new(classroom, age, permission, name)
  end

  def create_a_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(specialization, age, name)
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.type}] Name: #{person.name} ID: #{person.id}, Age: #{person.age}"
    end
  end
end
