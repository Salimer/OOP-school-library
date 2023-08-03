require_relative 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Math', 30, 'Abdulali')
  end

  context 'Create and object of the teacher class' do
    it 'should return the correct name = Abdulali' do
      expect(@teacher.name).to eql 'Abdulali'
    end

    it 'should return the correct age = 30' do
      expect(@teacher.age).to eql 30
    end

    it 'should return the correct specialization = Math' do
      expect(@teacher.specialization).to eql 'Math'
    end
  end

  context 'When using can_use_services? method' do
    it 'should return false if under age and no parent permission' do
      expect(@teacher.can_use_services?).to be true
    end
  end

  context 'Change the data to HASH format:' do
    it 'Check if the object is converted into hash' do
      expect(@teacher.to_hash.class).to eq Hash
    end
  end
end
