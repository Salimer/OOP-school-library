require_relative 'spec_helper'
require 'stringio'

describe App do
    before :each do
        @app = App.new()
    end

    context '#list_all_books' do
        it 'should list all books' do
            # Arrange
            book1 = Book.new('Book 1', 'Author 1')
            book2 = Book.new('Book 2', 'Author 2')
      
            # Add the sample books to the app's book collection
            @app.instance_variable_get(:@books).push(book1, book2)
            
            expected_output = ""
            books = @app.instance_variable_get("@books")

            books.each do |book|
                expected_output += "Title: \"#{book.title}\", Author: #{book.author}\n"
            end

            output = StringIO.new
            $stdout = output

            # Act
            # Redirect stdout to capture the output
            @app.list_all_books
            # Reset stdout
            @stdout = STDOUT

            # Assert
            expect(output.string).to eq(expected_output)
        end
    end

    context '#list_all_people' do
        it 'should list all people' do
            # Arrange
            expected_output = ""
            people = @app.instance_variable_get("@people")

            people.each do |person|
                expected_output += "[#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}\n"
            end

            output = StringIO.new
            $stdout = output

            # Act
            # Redirect stdout to capture the output
            @app.list_all_people
            # Reset stdout
            @stdout = STDOUT

            # Assert
            expect(output.string).to eq(expected_output)
        end
    end

    context '#create_a_person' do
        it 'should create a student when choice is 1' do
        # Simulate user input (choice 1 for student)
        allow_any_instance_of(Kernel).to receive(:gets).and_return("1\n", "John Doe\n", "15\n", "Y\n")

        # Capture the console output
        output = StringIO.new
        $stdout = output

        # Act
        @app.create_a_person('1', 'John Doe', 15)

        # Reset stdout
        $stdout = STDOUT

        # Assert
        expect(output.string).to include('Person created successfully')
        expect(@app.instance_variable_get(:@people).last).to be_a(Student)
        expect(@app.instance_variable_get(:@people).last.name).to eq('John Doe')
        expect(@app.instance_variable_get(:@people).last.age).to eq(15)
        end

        it 'should create a teacher when choice is 2' do
        # Simulate user input (choice 2 for teacher)
        allow_any_instance_of(Kernel).to receive(:gets).and_return("2\n", "Jane Smith\n", "30\n", "Math\n")

        # Capture the console output
        output = StringIO.new
        $stdout = output

        # Act
        @app.create_a_person('2', 'Jane Smith', 30)

        # Reset stdout
        $stdout = STDOUT

        # Assert
        expect(output.string).to include('Person created successfully')
        expect(@app.instance_variable_get(:@people).last).to be_a(Teacher)
        expect(@app.instance_variable_get(:@people).last.name).to eq('Jane Smith')
        expect(@app.instance_variable_get(:@people).last.age).to eq(30)
        end

        it 'should handle invalid choice' do
        # Simulate user input (invalid choice)
        allow_any_instance_of(Kernel).to receive(:gets).and_return("3\n")

        # Capture the console output
        output = StringIO.new
        $stdout = output

        # Act
        @app.create_a_person('3', 'Invalid', 0)

        # Reset stdout
        $stdout = STDOUT

        # Assert
        expect(output.string).to include('wrong choice, die')
        expect(@app.instance_variable_get(:@people).last).to be_nil
        end
    end

    context '#create_a_book' do
        it 'should create a book' do
        # Capture the console output
        output = StringIO.new
        $stdout = output

        # Act
        @app.create_a_book('Game of thrones', 'George Matt')

        # Reset stdout
        $stdout = STDOUT

        # Assert
        expect(output.string).to include('Book created successfully')
        expect(@app.instance_variable_get(:@books).last).to be_a(Book)
        expect(@app.instance_variable_get(:@books).last.title).to eq('Game of thrones')
        expect(@app.instance_variable_get(:@books).last.author).to eq('George Matt')
        end
    end

    context '#create_a_rental' do
        it 'should create a rental successfully' do
        # Add some books and people for testing
        book1 = Book.new('Book 1', 'Author 1')
        book2 = Book.new('Book 2', 'Author 2')
        person1 = Teacher.new('Math', 35, 'Teacher 1')
        person2 = Student.new(Classroom.new('Physics'), 20, true, 'Student 1')

        @app.instance_variable_get(:@books).push(book1, book2)
        @app.instance_variable_get(:@people).push(person1, person2)

        # Simulate user input
        allow_any_instance_of(Kernel).to receive(:gets).and_return("1\n", "1\n", "2023-08-10\n")

        # Capture the console output
        output = StringIO.new
        $stdout = output

        # Act
        @app.create_a_rental

        # Reset stdout
        $stdout = STDOUT

        # Assert
        expect(output.string).to include('Rental created successfully')
        expect(@app.instance_variable_get(:@rentals).last).to be_a(Rental)
        expect(@app.instance_variable_get(:@rentals).last.date).to eq('2023-08-10')
        end
    end

    # context '#list_all_rentals_for_a_given_person_id' do
    #     it 'should list all rentals for a given person ID' do
    #     # Add some rentals for testing
    #     person1 = Teacher.new('Math', 35, 'Teacher 1')
    #     person2 = Student.new(Classroom.new('Physics'), 20, true, 'Student 1')
    #     book1 = Book.new('Book 1', 'Author 1')
    #     book2 = Book.new('Book 2', 'Author 2')

    #     rental1 = Rental.new('2023-08-01', book1, person1, [0, 0])
    #     rental2 = Rental.new('2023-08-02', book2, person2, [1, 1])
    #     rental3 = Rental.new('2023-08-03', book1, person2, [1, 0])

    #     @app.instance_variable_get(:@rentals).push(rental1, rental2, rental3)

    #     # Simulate user input for person ID
    #     allow_any_instance_of(Kernel).to receive(:gets).and_return("2\n")

    #     # Capture the console output
    #     output = capture_stdout do
    #         @app.list_all_rentals_for_a_given_person_id
    #     end

    #     # Assert
    #     expect(output).to include('Rentals:')
    #     expect(output).to include('2023-08-02')
    #     expect(output).to include('2023-08-03')
    #     expect(output).not_to include('2023-08-01')
    #     end

    #     it 'should handle invalid person ID' do
    #     # Simulate user input for invalid person ID
    #     allow_any_instance_of(Kernel).to receive(:gets).and_return("10\n")

    #     # Capture the console output
    #     output = capture_stdout do
    #         @app.list_all_rentals_for_a_given_person_id
    #     end

    #     # Assert
    #     expect(output).to include('Rentals:')
    #     expect(output).to include('No rentals found for the given person ID')
    #     end
    # end
end

def capture_stdout
    output = StringIO.new
    $stdout = output
    yield
    output.string
  ensure
    $stdout = STDOUT
end