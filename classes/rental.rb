require_relative 'book'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
    person&.add_rental(self)
    book&.add_rental(self)
  end

  def to_hash
    {
      'date' => @date,
      'person' => @person.to_hash,
      'book' => @book.to_hash
    }
  end
end
