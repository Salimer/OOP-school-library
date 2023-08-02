require_relative './spec_helper'

describe Book do
    before :each do
        @book = Book.new('Afghanistan', 'Abdulali')
        # Student.new(classroom, age, permission, name)
    end

    context 'Add new book' do
        it 'Check if the @book is an object of the Book' do
            expect(@book).to be_an_instance_of Book
        end
        it 'Check for title' do
            expect(@book.title).to eq 'Afghanistan'
        end
        it 'Check for author' do
            expect(@book.author).to eq 'Abdulali'
        end
    end
end