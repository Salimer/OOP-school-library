require_relative 'app'
require_relative 'user_interactions'

def switch(user, number)
  loop do
    case number
    when '1'
      number = user.list_all_books
    when '2'
      number = user.list_all_people
    when '3'
      number = user.create_a_person
    when '4'
      number = user.create_a_book
    when '5'
      number = user.create_a_rental
    when '6'
      number = user.list_all_rentals_for_a_given_person_id
    else
      user.exit
      break
    end
  end
end

def main()
  app = App.new
  user = UserInteractions.new(app)
  puts 'Welcome to School Library App!'
  number = user.list_numbers
  switch(user, number)
end

main
