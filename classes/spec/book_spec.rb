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

    context 'Change the data to HASH format:' do
        it 'Check if the book object is converted to JSON format' do
            hash_obj = @book.to_hash.to_s
            expect(hash_obj).to eq '{"title"=>"Afghanistan", "author"=>"Abdulali", "rentals"=>[]}'
        end
        it 'Check if the array is converted into hash' do
            expect(@book.to_hash.class).to eq Hash
        end
    end
end