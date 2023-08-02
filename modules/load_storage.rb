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
        arr = create_person_from_data(data) unless data == []
        arr
      end
    
      def load_books_data
        load_data_from_file('books')
      end
    
      def load_rentals_data
        load_data_from_file('rentals')
      end

      def create_book_from_data(data)
        Book.new(data['title'], data['author'])
      end

      def create_person_from_data(data_base)
        # binding.pry
        data_base.each do |data|
            if data['type'] == 'Student'
            Student.new(data['age'], data['parent_permission'], data['name'])
            elsif data['type'] == 'Teacher'
            Teacher.new(data['specialization'], data['age'], data['name'])
            else
            nil
            end
        end
      end

      def create_rental_from_data(data)
        date = data['date']
        book = create_book_from_data(data['book'])
        person = create_person_from_data(data['person'])
        Rental.new(date, book, person) if book && person
      end
end