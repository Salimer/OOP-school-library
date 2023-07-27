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

