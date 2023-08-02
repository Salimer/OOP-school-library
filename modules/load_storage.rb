require 'pry'

module Load_storage
    def load_data_from_file(file_name)
        file_path = "storage/#{file_name}.json"
    
        return [] unless File.exist?(file_path)
    
        data_from_file = File.read(file_path)
        JSON.parse(data_from_file, create_additions: true)
      end
    
      def load_people_data
        data = load_data_from_file('people')
        return [] if data == []
        create_person_from_data(data)
      end
    
      def load_books_data
        data = load_data_from_file('books')
        return [] if data == []
        create_book_from_data(data)
      end
    
      def load_rentals_data
        data = load_data_from_file('rentals')
        return [] if data == []
        create_rental_from_data(data)
      end

      def create_book_from_data(data_base)
        if data_base.class == Hash
            title = data_base['title']
            author = data_base['author']
          book = Book.new(title, author)
          return book
        end

        books = []
        data_base.each do |data| 
            # binding.pry
            title = data['title']
            author = data['author']
          book = Book.new(title, author)
          books << book
        end
        books
      end

      def create_person_from_data(data_base)
        # binding.pry
        if data_base.class == Hash
            if data_base['type'] == 'Student'
                label = 'math'
                classroom = Classroom.new(label)
                person = Student.new(classroom, data_base['age'], data_base['parent_permission'], data_base['name'], data_base['id'])
                person.type = data_base['type']
              elsif data_base['type'] == 'Teacher'
                person = Teacher.new(data_base['specialization'], data_base['age'], data_base['name'], data_base['id'])
                person.type = data_base['type']
              else
                nil
              end
          return person
        end

        people = []
        data_base.each do |data|
            if data['type'] == 'Student'
              label = 'math'
              classroom = Classroom.new(label)
              person = Student.new(classroom, data['age'], data['parent_permission'], data['name'], data['id'])
            #   binding.pry
              person.type = data['type']
            elsif data['type'] == 'Teacher'
              person = Teacher.new(data['specialization'], data['age'], data['name'], data['id'])
              person.type = data['type']
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
          person_book_index = data['person_book_index']
          rental = Rental.new(date, @books[person_book_index[1]], @people[person_book_index[0]], data['person_book_index'])
          rentals << rental
        end
        rentals
      end

      def add_rental_date(date_arr)
        date_arr.each do |date|
            
        end
      end
end