require_relative 'spec_helper'

describe App do
    before :each do
        @app = App.new()
    end

    context '#list_all_books' do
        it 'should list all books' do
            # Arrange
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
end