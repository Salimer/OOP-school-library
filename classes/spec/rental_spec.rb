require_relative './spec_helper'

describe Rental do
    before :each do
        @book = Book.new('Afghanistan', 'Abdulali')
        @teacher = Teacher.new('math', 30, 'Salim')
        @rental = Rental.new('2023-08-02', @book, @teacher, [0, 0])
    end

    context 'Add a rental' do
        it 'Check if the rental is an object of the Rental class' do
            expect(@rental).to be_an_instance_of Rental
        end

        it 'Check if the rental.book is an object of the Book class' do
            expect(@rental.book).to be_an_instance_of Book
        end

        it 'Check if the rental.teacher is an object of the Teacher class' do
            expect(@rental.person).to be_an_instance_of Teacher
        end
    end
end
