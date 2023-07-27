require_relative 'app'

def list_all_books(app)
  app.list_all_books
  list_numbers
end

def list_all_people(app)
  app.list_all_people
  list_numbers
end

def create_a_person(app)
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  choice = gets.chomp
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  app.create_a_person(choice, name, age)
  list_numbers
end

def create_a_book(app)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  app.create_a_book(title, author)
  list_numbers
end

def create_a_rental(app)
  app.create_a_rental
  list_numbers
end

def list_all_rentals_for_a_given_person_id(app)
  app.list_all_rentals_for_a_given_person_id
  list_numbers
end

def invalid
  puts 'invalid choice'
  list_numbers
end

def list_numbers()
  list = "
Please choose an option by enterin a number (1-7):
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

def switch(app, number)
  loop do
    case number
    when '1'
      number = list_all_books(app)
    when '2'
      number = list_all_people(app)
    when '3'
      number = create_a_person(app)
    when '4'
      number = create_a_book(app)
    when '5'
      number = create_a_rental(app)
    when '6'
      number = list_all_rentals_for_a_given_person_id(app)
    else
      puts 'Thank you for using this app!'
      break
    end
  end
end

def main()
  app = App.new
  puts 'Welcome to School Library App!'
  number = list_numbers
  switch(app, number)
end

main
