require_relative 'spec_helper'

describe Nameable do
  context '#correct_name' do
    it 'should raise NotImplementedError' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
