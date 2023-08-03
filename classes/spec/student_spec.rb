require_relative 'spec_helper'

describe Student do
  before :each do
    @classroom = Classroom.new('Math')
    @student = Student.new(@classroom, 10, true, 'Abdulali')
  end

  context '#play_hooky' do 
    it "should return '¯(ツ)/¯'" do
      expect(@student.play_hooky).to eq '¯(ツ)/¯'
    end

    it 'should return the correct age = 10' do
      expect(@student.age).to eql 10
    end

    it 'should return the correct name = Abdulali' do
      expect(@student.name).to eql 'Abdulali'
    end
  end

  context 'Change the data to HASH format:' do
    it 'Check if the array is converted into hash' do
        expect(@student.to_hash.class).to eq Hash
    end
  end
end
