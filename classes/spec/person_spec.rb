require_relative 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(10, 30, 'Abdulali')
    @unknown = Person.new(10, 10)
    @book = Book.new('Afghanistan', 'Abdulali')
    @rental = Rental.new('2023-08-02', @book, @person, [0, 0])
  end

  context 'When testing a Person class' do
    it 'takes three parameters and returns a Person object' do
      expect(@person).to be_an_instance_of Person
    end

    it 'should return the correct age = 30' do
      expect(@person.age).to eql 30
    end

    it 'should return the correct name = Abdulali' do
      expect(@person.name).to eql 'Abdulali'
    end
  end

  context 'When using can_use_services? method' do
    it 'should return false if under age and no parent permission' do
      expect(@person.can_use_services?).to be true
    end

    it 'should return true have parent permission' do
      expect(@unknown.can_use_services?).to be true
    end
  end

  context 'When adding a new rentals' do
    it 'The add_rental method returns a rental and adds it to the book' do
      @person.add_rental(@rental)
      expect(@person.rentals.length).to eql 1
    end
  end

  context 'When using correct_name method' do
    it 'should return the correct name' do
      expect(@unknown.correct_name).to eql 'unknown'
    end
  end
end
