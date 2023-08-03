require_relative 'book'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person, person_book_index)
    @date = date
    @person = person
    @book = book
    @person_book_index = person_book_index
  end

  def to_hash
    {
      'date' => @date,
      'person' => @person.to_hash,
      'book' => @book.to_hash,
      'person_book_index' => @person_book_index
    }
  end
end
