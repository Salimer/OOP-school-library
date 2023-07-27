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

