require './modules/storage'

class UserInteractions
  include Storage

  def initialize(app)
    @app = app
  end

  def list_all_books()
    @app.list_all_books
    list_numbers
  end

  def list_all_people()
    @app.list_all_people
    list_numbers
  end

  def create_a_person()
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    @app.create_a_person(choice, name, age)
    list_numbers
  end

  def create_a_book()
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @app.create_a_book(title, author)
    list_numbers
  end

  def create_a_rental()
    @app.create_a_rental
    list_numbers
  end

  def list_all_rentals_for_a_given_person_id()
    @app.list_all_rentals_for_a_given_person_id
    list_numbers
  end

  def invalid
    puts 'invalid choice'
    list_numbers
  end

  def list_numbers()
    list = "
Please choose an option by entering a number (1-7):
1 - List all books
2 - List all people
3 - Create a person
4 - Create a book
5 - Create a rental
6 - List all rentals for a given person id
7 - Exit
"
    puts list
    gets.chomp
  end

  def exit
    create_storage_directory unless storage_directory_check?
    app_arrays = %w[people books rentals]

    app_arrays.each do |file|
      data = @app.instance_variable_get("@#{file}")
      json_data = data.map(&:to_hash)
      create_file(file, json_data)
    end

    puts 'Thank you for using this app!'
  end
end
