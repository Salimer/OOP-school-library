require_relative '../nameable'

RSpec.describe Nameable do
  describe '#correct_name' do
    it 'should raise NotImplementedError' do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
