require 'pry'

module Load_storage
    def load_data_from_file(file_name)
        file_path = "storage/#{file_name}.json"
    
        return [] unless File.exist?(file_path)
    
        data_from_file = File.read(file_path)
        JSON.parse(data_from_file, create_additions: true)
      end
    
      def load_people_data
        create_person_from_data(load_data_from_file('people'))
      end
    
      def load_books_data
        create_book_from_data(load_data_from_file('books'))
      end
    
      def load_rentals_data
        create_rental_from_data(load_data_from_file('rentals'))
      end

      def create_book_from_data(data_base)
        books = []
        data_base.each do |data| 
          book = Book.new(data['title'], data['author'])
          rentals = data['rentals']
          book.rentals = rentals.map { |rental_data| Rental.new(rental_data['date']) }
          books << book
        end
        books
      end

      def create_person_from_data(data_base)
        # binding.pry
        people = []
        data_base.each do |data|
            if data['type'] == 'Student'
              label = 'math'
              classroom = Classroom.new(label)
              person = Student.new(classroom, data['age'], data['parent_permission'], data['name'])
            elsif data['type'] == 'Teacher'
              person = Teacher.new(data['specialization'], data['age'], data['name'])
            else
              nil
            end
            people << person
        end
        people
      end

      def create_rental_from_data(data_base)
        rentals = []
        data_base.each do |data|
          date = data['date']
          book = create_book_from_data(data['book'])
          person = create_person_from_data(data['person'])
          rental = Rental.new(date, book, person) if book && person
          rentals << rental
        end
        rentals
      end
end